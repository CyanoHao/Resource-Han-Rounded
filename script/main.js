"use strict";

const { readOtf, writeOtf } = require("../module/font-io");
const { roundFont } = require("../module/round-font");
const { extendShortStroke } = require("../module/extend-short-stroke");
const { buildVFMetaData } = require("../module/build-meta-data");
const { filename } = require("../configure");

const param = JSON.parse(process.argv[2]);

const font = readOtf(filename.shs(param.subfamily));
extendShortStroke(font);
roundFont(font);
buildVFMetaData(font, param);
writeOtf(font, filename.cff2Vf(param.subfamily), false);
