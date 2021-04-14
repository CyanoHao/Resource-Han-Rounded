"use strict";

const fs = require("fs");
const { FontIo, Ot } = require("ot-builder");

module.exports = {
	readOtf: function (filename) {
		const otfBuf = fs.readFileSync(filename);
		const sfnt = FontIo.readSfntOtf(otfBuf);
		const font = FontIo.readFont(sfnt, Ot.ListGlyphStoreFactory);
		return font;
	},

	writeOtf: function (font, filename) {
		const sfnt = FontIo.writeFont(font);
		const otfBuf = FontIo.writeSfntOtf(sfnt);
		fs.writeFileSync(filename, otfBuf);
	},
};
