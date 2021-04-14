"use strict";

const { readOtf, writeOtf } = require("./script/font-io");
const { roundFont } = require("./script/round-font");
const { instanceOtf } = require("./script/instance-font");

const font = readOtf("SourceHanSansCN-VF.otf");
roundFont(font);
writeOtf(font, "ResourceHanRoundedCN-VF.otf");

instanceOtf("ResourceHanRoundedCN-VF.otf", "ResourceHanRoundedCN-Heavy.otf", [['wght', 1], ['rond', 0]]);
