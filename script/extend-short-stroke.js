"use strict";

const { Ot } = require("ot-builder");

// based on measurement of SHS
const params = {
	strokeWidth: { light: 29, heavy: 155 },
};

function circularAt(arr, idx) {
	const quotient = Math.floor(idx / arr.length);
	const remainder = idx - quotient * arr.length;
	return arr[remainder];
}

function abs(num) {
	return num >= 0 ? num : -num;
}

// some 横s of 横折s in SHS is shorter than expected.
// extend to align them.
// ─────┬──┬──┐
//      │  │  │
// ─────┼──┘  │
//      │     │
//
function extendShortStroke(font) {
	const dimWght = font.fvar.axes[0].dim;
	const instanceShsWghtMax = new Map([[dimWght, 1]]);
	const masterDimWghtMax = { dim: dimWght, min: 0, peak: 1, max: 1 };
	const masterWghtMax = new Ot.Var.Master([masterDimWghtMax]);
	const masterSet = new Ot.Var.MasterSet();
	masterSet.getOrPush(masterWghtMax);
	const valueFactory = new Ot.Var.ValueFactory(masterSet);

	function approxEq(a, b, threshold = 1) {
		if (typeof a == 'number' && typeof b == 'number')
			return abs(a - b) <= threshold;
		return abs(Ot.Var.Ops.originOf(a) - Ot.Var.Ops.originOf(b)) <= threshold &&
			abs(Ot.Var.Ops.evaluate(a, instanceShsWghtMax) - Ot.Var.Ops.evaluate(b, instanceShsWghtMax)) <= threshold;
	}

	function canBeRightEnd(bottomRight, topRight) {
		return bottomRight.kind == 0 && topRight.kind == 0 &&
			approxEq(bottomRight.x, topRight.x) &&
			approxEq(
				Ot.Var.Ops.originOf(topRight.y) - Ot.Var.Ops.originOf(bottomRight.y),
				params.strokeWidth.light,
				3,
			) &&
			Ot.Var.Ops.evaluate(topRight.y, instanceShsWghtMax) - Ot.Var.Ops.evaluate(bottomRight.y, instanceShsWghtMax) <= params.strokeWidth.heavy;
	}

	function canBeTopEnd(topRight, topLeft) {
		return topRight.kind == 0 && topLeft.kind == 0 &&
			approxEq(topRight.y, topLeft.y) &&
			approxEq(
				Ot.Var.Ops.originOf(topRight.x) - Ot.Var.Ops.originOf(topLeft.x),
				params.strokeWidth.light,
				3,
			) &&
			Ot.Var.Ops.evaluate(topRight.x, instanceShsWghtMax) - Ot.Var.Ops.evaluate(topLeft.x, instanceShsWghtMax) <= params.strokeWidth.heavy;
	}

	function isBetween(a, x, b) {
		return Ot.Var.Ops.originOf(a) < Ot.Var.Ops.originOf(x) &&
			Ot.Var.Ops.originOf(x) < Ot.Var.Ops.originOf(b) &&
			Ot.Var.Ops.evaluate(a, instanceShsWghtMax) < Ot.Var.Ops.evaluate(x, instanceShsWghtMax) &&
			Ot.Var.Ops.evaluate(x, instanceShsWghtMax) < Ot.Var.Ops.evaluate(b, instanceShsWghtMax);
	}

	function makeVariance(valueDefault, valueWghtMax) {
		return valueFactory.create(valueDefault, [[masterWghtMax, valueWghtMax - valueDefault]]);
	}

	function checkSingleGlyph(glyph) {
		if (!glyph.geometry || !glyph.geometry.contours)
			return;
		const oldContours = glyph.geometry.contours;
		glyph.geometry.contours = [];

		for (const contour of oldContours) {
			// find possible 横, skip that contains more or less points.
			if (contour.length != 4) {
				glyph.geometry.contours.push(contour);
				continue;
			}

			// check witch points are on right end
			let bottomRightIdx = undefined;
			let topRightIdx = undefined;
			for (let idx = 0; idx < contour.length; idx++) {
				if (
					canBeRightEnd(contour[idx], circularAt(contour, idx + 1)) &&
					approxEq(circularAt(contour, idx - 1).x, circularAt(contour, idx + 2).x) &&
					approxEq(contour[idx].y, circularAt(contour, idx - 1).y) &&
					approxEq(circularAt(contour, idx + 1).y, circularAt(contour, idx + 2).y)
				) {
					bottomRightIdx = idx;
					topRightIdx = (idx + 1) % 4;
					break;
				}
			}
			if (typeof bottomRightIdx != 'number') {
				glyph.geometry.contours.push(contour);
				continue;
			}

			const bottomRight = contour[bottomRightIdx];
			const topRight = contour[topRightIdx];
			let extended = false;

			for (const ctr of oldContours) {
				// find possible 竖s
				if (ctr == contour || ctr.length < 4)
					continue;
				for (let idx = 0; idx < ctr.length; idx++) {
					if (
						// is top end
						canBeTopEnd(ctr[idx], circularAt(ctr, idx + 1)) &&
						approxEq(ctr[idx].x, circularAt(ctr, idx - 1).x) &&
						approxEq(circularAt(ctr, idx + 1).x, circularAt(ctr, idx + 2).x) &&
						// and 横's right end inside 竖
						approxEq(ctr[idx].y, topRight.y) &&
						isBetween(circularAt(ctr, idx + 1).x, topRight.x, ctr[idx].x)
					) {
						const newContour = [...contour];
						newContour[bottomRightIdx] = {
							x: makeVariance(
								Ot.Var.Ops.originOf(ctr[idx].x),
								Ot.Var.Ops.evaluate(ctr[idx].x, instanceShsWghtMax)
							),
							y: bottomRight.y,
							kind: 0,
						};
						newContour[topRightIdx] = {
							x: makeVariance(
								Ot.Var.Ops.originOf(ctr[idx].x),
								Ot.Var.Ops.evaluate(ctr[idx].x, instanceShsWghtMax)
							),
							y: topRight.y,
							kind: 0,
						};
						glyph.geometry.contours.push(newContour);
						extended = true;
						break;
					}
				}
				if (extended)
					break;
			}

			if (!extended)
				glyph.geometry.contours.push(contour);
		}
	}

	let count = 0;
	for (const glyph of font.glyphs.items) {
		checkSingleGlyph(glyph)
		count++;
		if (count % 1000 == 0)
			console.log("extendShortStroke:", count, "glyphs processed.");
	}
}

module.exports = {
	extendShortStroke: extendShortStroke,
};
