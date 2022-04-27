"use strict";

const { Ot, Rectify } = require("ot-builder");
const { readOtf, writeOtf } = require("./font-io");
const { roundTo } = require("./util");

function AxisRectifier() {
	return {
		dim: a => null,
		axis: a => null,
		addedAxes: []
	};
}

function ValueRectifier(instance) {
	const instanceValue = x => Ot.Var.Ops.evaluate(x, instance);
	return { coord: instanceValue, cv: instanceValue };
}

function convertToCff1(font) {
	const oldCff = font.cff;
	const cff = new Ot.Cff.Table(1);
	font.cff = cff;
	cff.postScriptFontName = "CFF2Font"; // fontTools use `CFF2Font` by default, so do we.
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

function roundCoordinate(font, precision = 1) {
	const rectifier = x => roundTo(x, precision);
	Rectify.inPlaceRectifyFontCoords(
		{ coord: rectifier, cv: rectifier },
		Rectify.IdPointAttachRectifier,
		font
	);
}

module.exports = {
	instanceFont,
	convertToCff1,
	roundCoordinate,
};
