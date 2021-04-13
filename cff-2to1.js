"use strict";

const fs = require("fs");
const { FontIo, Ot } = require("ot-builder");

const iFilename = process.argv[2];
const oFilename = process.argv[3];

const iOtfBuf = fs.readFileSync(iFilename);
const iSfnt = FontIo.readSfntOtf(iOtfBuf);
const font = FontIo.readFont(iSfnt, Ot.ListGlyphStoreFactory);

const oldCff = font.cff;
font.cff = new Ot.Cff.Table(1);
font.cff.postScriptFontName = "CFF2Font"; // fontTools use `CFF2Font` by default, so do we.
font.cff.cid = oldCff.cid;
font.cff.fdArray = oldCff.fdArray;
font.cff.fdSelect = oldCff.fdSelect;

const oSfnt = FontIo.writeFont(font);
const oOtfBuf = FontIo.writeSfntOtf(oSfnt);
fs.writeFileSync(oFilename, oOtfBuf);
