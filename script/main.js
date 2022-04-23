"use strict";

const { readOtf, writeOtf } = require("../module/font-io");
const { roundFont } = require("../module/round-font");
const { extendShortStroke } = require("../module/extend-short-stroke");
const { buildVFMetaData } = require("../module/build-meta-data");
const { config } = require("../configure");

const param = JSON.parse(process.argv[2]);

const font = readOtf(`src/${config.orthography.shsMap[param.subfamily]}-VF.otf`);
extendShortStroke(font);
roundFont(font);
buildVFMetaData(font, param);
writeOtf(font, `build/cff2/ResourceHanRounded${param.subfamily}-VF.otf`, false);
