"use strict";

const fs = require("fs");
const { FontIo, Ot, Rectify } = require("ot-builder");

const iOtfBuf = fs.readFileSync("rhr-cn.otf");
const iSfnt = FontIo.readSfntOtf(iOtfBuf);
const font = FontIo.readFont(iSfnt, Ot.ListGlyphStoreFactory);

function AxisRectifier() {
    return {
        dim: a => null,
        axis: a => null,
        addedAxes: []
    };
}

function ValueRectifier(instance) {
    return {
        coord: x => Ot.Var.Ops.evaluate(x, instance),
        cv: x => Ot.Var.Ops.evaluate(x, instance)
    };
}

const dimWght = font.fvar.axes[0].dim;
const dimRond = font.fvar.axes[1].dim;
const instance = new Map([[dimWght, 1], [dimRond, 0]]);

Rectify.inPlaceRectifyFontCoords(
    ValueRectifier(instance),
    Rectify.IdPointAttachRectifier,
    font
);
font.fvar = font.avar = null;

const oSfnt = FontIo.writeFont(font);
const oOtfBuf = FontIo.writeSfntOtf(oSfnt);
fs.writeFileSync("rhr-cn-instance.otf", oOtfBuf);
