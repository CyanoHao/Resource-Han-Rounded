"use strict";

const fs = require("fs");
const { FontIo, Ot } = require("ot-builder");

const iOtfBuf = fs.readFileSync("rhr-cn-instance.ttf");
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
fs.writeFileSync("rhr-cn-cff1.otf", oOtfBuf);
