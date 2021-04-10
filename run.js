"use strict";

const fs = require("fs");
const { FontIo, Ot } = require("ot-builder");

//
// read font from otf
//

const iOtfBuf = fs.readFileSync("shs-cn.otf");
const iSfnt = FontIo.readSfntOtf(iOtfBuf);
const font = FontIo.readFont(iSfnt, Ot.ListGlyphStoreFactory);

//
// font variation metadata
//

const dimWght = font.fvar.axes[0].dim
const dimRond = new Ot.Var.Dim('ROND', 0, 100, 100);
const dimRondNameId = 256 + 32;
font.fvar.axes.push(new Ot.Fvar.Axis(dimRond, Ot.Fvar.AxisFlags.Default, dimRondNameId));
font.name.records.push({ platformID: 3, encodingID: 1, languageID: 0x0409, nameID: dimRondNameId, value: "Roundness" });
for (const instance of font.fvar.instances) {
	instance.coordinates.set(dimRond, dimRond.default);
}
font.avar.segmentMaps.set(dimRond, [[-1, -1], [0, 0], [1, 1]]);

//
// masters
//

const masterDimWghtMin = { dim: dimWght, min: 0, peak: 0, max: 1 };
const masterDimWghtMax = { dim: dimWght, min: 0, peak: 1, max: 1 };
const masterDimRondMin = { dim: dimRond, min: -1, peak: -1, max: 0 };
const masterDimRondMax = { dim: dimRond, min: -1, peak: 0, max: 0 };

const masterWghtMinRondMin = new Ot.Var.Master([masterDimWghtMin, masterDimRondMin]);
/* masterWghtMinRondMax is origin. */
const masterWghtMaxRondMin = new Ot.Var.Master([masterDimWghtMax, masterDimRondMin]);
const masterWghtMaxRondMax = new Ot.Var.Master([masterDimWghtMax, masterDimRondMax]);

const masterSet = new Ot.Var.MasterSet();
masterSet.getOrPush(masterWghtMinRondMin);
masterSet.getOrPush(masterWghtMaxRondMin);
masterSet.getOrPush(masterWghtMaxRondMax);
const valueFactory = new Ot.Var.ValueFactory(masterSet);

// create Ot.Var.Value from values of 4 vertices of the region.
function makeVariance(
	valueWghtMinRondMin, valueWghtMinRondMax,
	valueWghtMaxRondMin, valueWghtMaxRondMax) {
	const origin = valueWghtMinRondMax
	return valueFactory.create(origin, [
		[masterWghtMinRondMin, valueWghtMinRondMin - origin],
		[masterWghtMaxRondMin, valueWghtMaxRondMin - valueWghtMinRondMin - valueWghtMaxRondMax + origin],
		[masterWghtMaxRondMax, valueWghtMaxRondMax - origin]
	]);
}

//
// transform
//

const radius = { min: 24, max: 84 };

// extract values of 2 masters.
const instanceShsWghtMax = new Map([[dimWght, 1]]);
function extractPoint(point) {
	const xShsOrigin = Ot.Var.Ops.originOf(point.x);
	const xShsWghtMax = Ot.Var.Ops.evaluate(point.x, instanceShsWghtMax);
	const yShsOrigin = Ot.Var.Ops.originOf(point.y);
	const yShsWghtMax = Ot.Var.Ops.evaluate(point.y, instanceShsWghtMax);
	const kind = point.kind;
	return [xShsOrigin, xShsWghtMax, yShsOrigin, yShsWghtMax, kind];
}

// split contour to segments. a segment is a line or a simple curve.
//   type: `line` or `curve`
//   m0, m1: values at masters
//     p1, p2: end point
//     c1, c2: control point
//     t1, t2: tangent vector
function splitContour(contour) {
	const segments = [];
	if (contour.length < 2) // malformed
		return segments;
	contour = [...contour, contour[0]]; // the last end point may be omitted
	const length = contour.length;
	const advance = index => (index == length - 1 ? 0 : index + 1);
	let point = contour[0];
	let current = { m0: {}, m1: {} };
	let [m0x, m1x, m0y, m1y, kind] = extractPoint(point); // first point is alway on-curve.
	current.m0.p1 = { x: m0x, y: m0y };
	current.m1.p1 = { x: m1x, y: m1y };
	let status = 1; // 0 --- current seg is empty; 1 -- p1 read
	for (let i = 1; i;) {
		point = contour[i];
		[m0x, m1x, m0y, m1y, kind] = extractPoint(point);
		switch (status) {
			case 0: // current seg is empty, read p1
				current.m0.p1 = { x: m0x, y: m0y };
				current.m1.p1 = { x: m1x, y: m1y };
				status = 1;
				i = advance(i);
				break;
			case 1: // p1 read
				switch (kind) {
					case 0: // on-curve point, possibly line
						if (
							(m0x == current.m0.p1.x && m0y == current.m0.p1.y) &&
							(m1x == current.m1.p1.x && m1y == current.m1.p1.y)
						)
							; // same point, ignore
						else {
							current.type = "line";
							current.m0.p2 = { x: m0x, y: m0y };
							current.m0.t1 = { x: (current.m0.p2.x - current.m0.p1.x) / 2, y: (current.m0.p2.y - current.m0.p1.y) / 2 };
							current.m0.t2 = current.m0.t1;
							current.m1.p2 = { x: m1x, y: m1y };
							current.m1.t1 = { x: (current.m1.p2.x - current.m0.p1.x) / 2, y: (current.m1.p2.y - current.m1.p1.y) / 2 };
							current.m1.t2 = current.m1.t1;
							segments.push(current);
						}
						break;
					case 1: // off-curve point, curve
						current.m0.c1 = { x: m0x, y: m0y };
						current.m1.c1 = { x: m1x, y: m1y };
						point = contour[++i]; // next control point
						[m0x, m1x, m0y, m1y, kind] = extractPoint(point);
						current.m0.c2 = { x: m0x, y: m0y };
						current.m1.c2 = { x: m1x, y: m1y };
						i = advance(i);
						point = contour[i]; // next end point, may wrap
						[m0x, m1x, m0y, m1y, kind] = extractPoint(point);
						current.m0.p2 = { x: m0x, y: m0y };
						current.m1.p2 = { x: m1x, y: m1y };

						if (
							(current.m0.c1.x == current.m0.p1.x && current.m0.c1.y == current.m0.p1.y) ||
							(current.m1.c1.x == current.m1.p1.x && current.m1.c1.y == current.m1.p1.y) ||
							(current.m0.c2.x == current.m0.p2.x && current.m0.c2.y == current.m0.p2.y) ||
							(current.m1.c2.x == current.m1.p2.x && current.m1.c2.y == current.m1.p2.y)
						) { // decayed cubic curve, treat it as line
							current.type = "line";
							current.m0.t1 = { x: (current.m0.p2.x - current.m0.p1.x) / 2, y: (current.m0.p2.y - current.m0.p1.y) / 2 };
							current.m0.t2 = current.m0.t1;
							current.m1.t1 = { x: (current.m1.p2.x - current.m0.p1.x) / 2, y: (current.m1.p2.y - current.m1.p1.y) / 2 };
							current.m1.t2 = current.m1.t1;
						} else {
							current.type = "curve";
							// use tt-like tangent vector
							current.m0.t1 = { x: (current.m0.c1.x - current.m0.p1.x) / 2 * 3, y: (current.m0.c1.y - current.m0.p1.y) / 2 * 3 };
							current.m0.t2 = { x: (current.m0.p2.x - current.m0.c2.x) / 2 * 3, y: (current.m0.p2.y - current.m0.c2.y) / 2 * 3 };
							current.m1.t1 = { x: (current.m1.c1.x - current.m1.p1.x) / 2 * 3, y: (current.m1.c1.y - current.m1.p1.y) / 2 * 3 };
							current.m1.t2 = { x: (current.m1.p2.x - current.m1.c2.x) / 2 * 3, y: (current.m1.p2.y - current.m1.c2.y) / 2 * 3 };
						}
						segments.push(current);
						break;
				}
				current = { m0: {}, m1: {} };
				status = 0;
				break;
		}
	}
	return segments;
}

function cosine(vec1, vec2) {
	return (vec1.x * vec2.x + vec1.y * vec2.y) / Math.sqrt(vec1.x * vec1.x + vec1.y * vec1.y) / Math.sqrt(vec2.x * vec2.x + vec2.y * vec2.y);
}

function abs(vec) {
	return Math.sqrt(vec.x * vec.x + vec.y * vec.y);
}

function normalize(vec) {
	const length = abs(vec);
	return length ? { x: vec.x / length, y: vec.y / length } : { x: 0, y: 0 };
}

function transformContour(contour) {
	const segments = splitContour(contour);
	const result = [];
	const length = segments.length;
	if (length < 2) // malformed
		return result;
	const advance = index => (index == length - 1 ? 0 : index + 1);
	let prev = segments[length - 1];
	for (let i = 0; i < length; i++) {
		const cur = segments[i];
		const next = segments[advance(i)];
		const m0Seg = [];
		const m1Seg = [];
		const shsM0Seg = [];
		const shsM1Seg = [];
		const kind = [];
		const m0Cos0 = cosine(prev.m0.t2, cur.m0.t1);
		const m1Cos0 = cosine(prev.m1.t2, cur.m1.t1);
		if (m0Cos0 > 0.9 && m1Cos0 > 0.9) { // almost linear, keep this end point and control point
			m0Seg.push(cur.m0.p1);
			m1Seg.push(cur.m1.p1);
			shsM0Seg.push(cur.m0.p1);
			shsM1Seg.push(cur.m1.p1);
			kind.push(0);
			if (cur.type == "curve") {
				m0Seg.push(cur.m0.c1);
				m1Seg.push(cur.m1.c1);
				shsM0Seg.push(cur.m0.c1);
				shsM1Seg.push(cur.m1.c1);
				kind.push(1);
			}
		} else
		{ // build 2 halves of curve
			const m0Len = abs(cur.m0.t1);
			const m0Direction = normalize(cur.m0.t1);
			const m0Radius = Math.min(m0Len, radius.min);
			m0Seg.push({ // control point
				x: cur.m0.p1.x + m0Direction.x * m0Radius / 2,
				y: cur.m0.p1.y + m0Direction.y * m0Radius / 2
			});
			m0Seg.push({ // end point
				x: cur.m0.p1.x + m0Direction.x * m0Radius,
				y: cur.m0.p1.y + m0Direction.y * m0Radius
			});
			const m1Len = abs(cur.m1.t1);
			const m1Direction = normalize(cur.m1.t1);
			const m1Radius = Math.min(m1Len, radius.max);
			m1Seg.push({ // control point
				x: cur.m1.p1.x + m1Direction.x * m1Radius / 2,
				y: cur.m1.p1.y + m1Direction.y * m1Radius / 2
			});
			m1Seg.push({ // end point
				x: cur.m1.p1.x + m1Direction.x * m1Radius,
				y: cur.m1.p1.y + m1Direction.y * m1Radius
			});
			shsM0Seg.push(cur.m0.p1);
			shsM0Seg.push(cur.m0.p1);
			shsM1Seg.push(cur.m1.p1);
			shsM1Seg.push(cur.m1.p1);
			kind.push(2);
			kind.push(0);
			if (cur.type == "curve") {
				m0Seg.push({ // control point
					x: cur.m0.p1.x + m0Direction.x * m0Len / 3 * 2,
					y: cur.m0.p1.y + m0Direction.y * m0Len / 3 * 2
				});
				m1Seg.push({ // control point
					x: cur.m1.p1.x + m1Direction.x * m1Len / 3 * 2,
					y: cur.m1.p1.y + m1Direction.y * m1Len / 3 * 2
				});
				shsM0Seg.push(cur.m0.c1);
				shsM1Seg.push(cur.m1.c1);
				kind.push(1);
			}
		}
		const m0Cos1 = cosine(cur.m0.t2, next.m0.t1);
		const m1Cos1 = cosine(cur.m1.t2, next.m1.t1);
		if (m0Cos1 > 0.9 && m1Cos1 > 0.9) { // almost linear, keep this end point and control point
			if (cur.type == "curve") {
				m0Seg.push(cur.m0.c2);
				m1Seg.push(cur.m1.c2);
				shsM0Seg.push(cur.m0.c2);
				shsM1Seg.push(cur.m1.c2);
				kind.push(2);
			}
			/* p2 will be pushed in next segment */
		} else
		{ // build 2 halves of curve
			const m0Len = abs(cur.m0.t2);
			const m0Direction = normalize(cur.m0.t2);
			const m0Radius = Math.min(m0Len, radius.min);
			const m1Len = abs(cur.m1.t2);
			const m1Direction = normalize(cur.m1.t2);
			const m1Radius = Math.min(m1Len, radius.max);
			if (cur.type == "curve") {
				m0Seg.push({ // control point
					x: cur.m0.p2.x - m0Direction.x * m0Len / 3 * 2,
					y: cur.m0.p2.y - m0Direction.y * m0Len / 3 * 2
				});
				m1Seg.push({ // control point
					x: cur.m1.p2.x - m1Direction.x * m1Len / 3 * 2,
					y: cur.m1.p2.y - m1Direction.y * m1Len / 3 * 2
				});
				shsM0Seg.push(cur.m0.c2);
				shsM1Seg.push(cur.m1.c2);
				kind.push(2);
			}
			m0Seg.push({ // end point
				x: cur.m0.p2.x - m0Direction.x * m0Radius,
				y: cur.m0.p2.y - m0Direction.y * m0Radius
			});
			m0Seg.push({ // control point
				x: cur.m0.p2.x - m0Direction.x * m0Radius / 2,
				y: cur.m0.p2.y - m0Direction.y * m0Radius / 2
			});
			m1Seg.push({ // end point
				x: cur.m1.p2.x - m1Direction.x * m1Radius,
				y: cur.m1.p2.y - m1Direction.y * m1Radius
			});
			m1Seg.push({ // control point
				x: cur.m1.p2.x - m1Direction.x * m1Radius / 2,
				y: cur.m1.p2.y - m1Direction.y * m1Radius / 2
			});
			shsM0Seg.push(cur.m0.p2);
			shsM0Seg.push(cur.m0.p2);
			shsM1Seg.push(cur.m1.p2);
			shsM1Seg.push(cur.m1.p2);
			kind.push(0);
			kind.push(1);
		}
		for (let j = 0; j < m0Seg.length; j++) {
			result.push(Ot.Glyph.Point.create(
				makeVariance(shsM0Seg[j].x, m0Seg[j].x, shsM1Seg[j].x, m1Seg[j].x),
				makeVariance(shsM0Seg[j].y, m0Seg[j].y, shsM1Seg[j].y, m1Seg[j].y),
				kind[j]
			));
		}
		prev = cur;
	}
	// adjust result, let it begin with end point
	if (result[0].kind)
		result.push(result.shift());
	console.log(contour, result);
	return result;
}

for (const glyph of font.glyphs.items) {
	if (!glyph.geometry || !glyph.geometry.contours)
		continue;
	const oldContours = glyph.geometry.contours;
	glyph.geometry.contours = [];
	for (const contour of oldContours) {
		glyph.geometry.contours.push(transformContour(contour));
	}
}

//
// write font to otf
//

const oSfnt = FontIo.writeFont(font);
const oOtfBuf = FontIo.writeSfntOtf(oSfnt);
fs.writeFileSync("rhr-cn.otf", oOtfBuf);
