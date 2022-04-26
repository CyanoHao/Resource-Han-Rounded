"use strict";

const { spawnSync } = require("child_process");
const { Ot, Rectify } = require('ot-builder');
const { readOtf, writeOtf } = require('../module/font-io');
const { filename } = require('../configure');
const { buildInstanceMetaData } = require("../module/build-meta-data");

function ValueRectifier(instance) {
	const instanceValue = x => Math.round(Ot.Var.Ops.evaluate(x, instance));
	return { coord: instanceValue, cv: instanceValue };
}

function convertToCff1(font) {
	const oldCff = font.cff;
	const cff = new Ot.Cff.Table(1);
	font.cff = cff;
	cff.postScriptFontName = "CFF2Font";
	const cid = new Ot.Cff.CID;
	cff.cid = cid;
	cid.registry = 'Adobe';
	cid.ordering = 'Identity';
	cid.supplement = 0;
	cff.topDict.cidCount = font.glyphs.items.length;
	cff.fdArray = oldCff.fdArray;
	cff.fdSelect = oldCff.fdSelect;
}

function instanceFont(font, parameters) {
	const dims = {};
	for (const axis of font.fvar.axes) {
		const dim = axis.dim;
		const tag = dim.tag;
		dims[tag] = dim;
	}
	const instance = new Map(parameters.map(([tag, value]) => [dims[tag], value]));
	Rectify.inPlaceRectifyFontCoords(
		ValueRectifier(instance),
		Rectify.IdPointAttachRectifier,
		font
	);
	font.fvar = font.avar = font.stat = null;
}

// FontForge treats CID-keyed OpenType/CFF as multiple subfont, convert to name-keyed
// build a dummy cmap to enforce FontForge to respect glyph order
function duplicateToNameKeyed(font) {
	const other = Object.assign({}, font);
	const cff = new Ot.Cff.Table(1);
	cff.postScriptFontName = "CFF2Font";
	cff.topDict.privateDict = other.cff.fdArray[0].privateDict;
	other.cff = cff;
	const cmap = new Ot.Cmap.Table();
	cmap.unicode = new Ot.Cmap.EncodingMap(font.glyphs.items.map((g, i) => [i, g]));
	other.cmap = cmap;
	return other;
}

function mergeSimplified(font, simplified) {
	for (let gid = 0; gid < font.glyphs.items.length; gid++) {
		font.glyphs.items[gid].contours = simplified.glyphs.items[gid].contours
	}
}

function normaliseWeight(weight) {
	if (weight <= 200)
		return 0;
	if (weight <= 300)
		return (weight - 200) / 100 * 0.16;
	if (weight <= 400)
		return (weight - 300) / 100 * (0.39 - 0.16) + 0.16;
	if (weight <= 500)
		return (weight - 400) / 100 * (0.56 - 0.39) + 0.39;
	if (weight <= 900)
		return (weight - 500) / 400 * (1 - 0.56) + 0.56;
	return 1;
}

function normaliseRoundness(roundness) {
	return Math.sqrt(roundness / 100) - 1;
}

const param = JSON.parse(process.argv[2]);

console.log('instace: loading');
const font = readOtf(filename.cff2Vf(param.subfamily));
console.log('instace: instancing');
instanceFont(font, [
	['wght', normaliseWeight(param.weight)],
	['ROND', normaliseRoundness(param.roundness)],
]);
buildInstanceMetaData(font, param);
convertToCff1(font);

const nameKeyed = duplicateToNameKeyed(font);
console.log('instace: saving immediate');
const ffIn = filename.cff1FfIn(param.subfamily, param.weight, param.roundness);
const ffOut = filename.cff1FfOut(param.subfamily, param.weight, param.roundness);
writeOtf(nameKeyed, ffIn);

console.log('instace: fontforging');
console.log('fontforge', '-script', 'script/simplify.pe', ffIn, ffOut);
const ff = spawnSync('fontforge', ['-script', 'script/simplify.pe', ffIn, ffOut], { stdio: 'ignore' });
if (ff.status !== 0)
	throw `instance: FontForge exited with code ${ff.status}`

console.log('instace: loading immediate');
const simplified = readOtf(ffOut);
mergeSimplified(font, simplified);

console.log('instace: saving');
writeOtf(font, filename.cff1Otf(param.subfamily, param.weight, param.roundness));
