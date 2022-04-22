"use strict";

const { readOtf, writeOtf } = require("./script/font-io");
const { roundFont } = require("./script/round-font");
const { instanceOtf } = require("./script/instance-font");
const { extendShortStroke } = require("./script/extend-short-stroke");

const font = readOtf("SourceHanSansCN-VF.otf");
extendShortStroke(font);
roundFont(font);
writeOtf(font, "ResourceHanRoundedCN-VF.otf");

instanceOtf("ResourceHanRoundedCN-VF.otf", "ResourceHanRoundedCN-Heavy.otf", [['wght', 1], ['ROND', 0]]);
