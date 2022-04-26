"use strict";

const { Ot } = require('ot-builder');
const { config } = require('../configure');

function makeNameEntry(nameId, value) {
	return {
		platformID: 3,
		encodingID: 1,
		languageID: 0x0409,
		nameID: nameId,
		value: value,
	}
}

const nameId = Ot.Name.NameID;

function makeVFBaseNameTable(subfamily) {
	const family = `${config.name.normal} ${subfamily} VF`;
	const psFamily = `${config.name.postscript}${subfamily}VF`;
	return [
		makeNameEntry(nameId.Copyright, config.copyright),
		makeNameEntry(nameId.LegacyFamily, family),
		makeNameEntry(nameId.LegacySubfamily, `Regular`),
		makeNameEntry(nameId.UniqueFontId, `${config.vendor.name}: ${family} ${config.version.name}`),
		makeNameEntry(nameId.FullFontName, family),
		makeNameEntry(nameId.VersionString, `Version ${config.version.name}`),
		makeNameEntry(nameId.PostscriptName, `${psFamily}-ExtraLight`),
		makeNameEntry(nameId.Manufacturer, config.vendor.name),
		makeNameEntry(nameId.Designer, config.designer),
		makeNameEntry(nameId.UrlVendor, config.vendor.url),
		makeNameEntry(nameId.LicenseDescription, config.license.description),
		makeNameEntry(nameId.LicenseInfoUrl, config.license.url),
		makeNameEntry(nameId.PreferredFamily, family),
		makeNameEntry(nameId.PreferredSubfamily, 'ExtraLight'),
		makeNameEntry(nameId.VariationsPostScriptNamePrefix, psFamily),
	];
}

function buildVFMetaData(font, param) {
	const { subfamily } = param;

	font.head.fontRevision = config.version.head;
	font.os2.achVendID = config.vendor.id;
	font.os2.usWeightClass = 200;

	const nameRecord = makeVFBaseNameTable(subfamily);
	font.name.records = nameRecord;
	let availableNameId = 256;
	function pushNameEntry(value) {
		nameRecord.push(makeNameEntry(availableNameId, value));
		return availableNameId++;
	}

	// fvar: axis
	const axis = font.fvar.axes;
	axis[0].axisNameID = pushNameEntry('Weight');
	axis[1].axisNameID = pushNameEntry('Roundness');
	const dimWght = axis[0].dim;
	dimWght.min = dimWght.default = 200;
	const dimRond = axis[1].dim;

	// fvar: instance
	const instance = [];
	const psFamily = `${config.name.postscript}${subfamily}VF`;
	font.fvar.instances = instance;
	for (const wghtValue of config.weight.instance) {
		const wghtName = config.weight.nameMap[wghtValue];
		for (const rondValue of config.roundness.instance) {
			const rondName = config.roundness.nameMap[rondValue];
			const subfamilyList = [];
			wghtName && subfamilyList.push(wghtName);
			rondName && subfamilyList.push(rondName);
			subfamilyList.length || subfamilyList.push('Regular');
			const subfamilyId = pushNameEntry(subfamilyList.join(' '));
			const psId = pushNameEntry(`${psFamily}-${subfamilyList.join('')}`);
			instance.push(new Ot.Fvar.Instance(
				subfamilyId,
				0,
				new Map([[dimWght, wghtValue], [dimRond, rondValue]]),
				psId,
			));
		}
	}

	// avar
	const segmentMap = font.avar.segmentMaps;
	segmentMap.set(dimWght, config.weight.avar);
	segmentMap.set(dimRond, config.roundness.avar);

	// STAT
	const statAxisWght = new Ot.Stat.Axis('wght', axis[0].axisNameID, 0);
	const statAxisRond = new Ot.Stat.Axis('ROND', axis[1].axisNameID, 1);
	font.stat.designAxes = [statAxisWght, statAxisRond];
	font.stat.elidedFallbackNameID = pushNameEntry('Regular');
	font.stat.assignments = [];
	for (const [min, nominal, max, name, flag] of config.weight.stat)
		font.stat.assignments.push([
			new Ot.Stat.AxisValue.Variable(statAxisWght, min, nominal, max),
			new Ot.Stat.NameAssignment(flag | 0, pushNameEntry(name)),
		]);
	for (const [min, nominal, max, name, flag] of config.roundness.stat)
		font.stat.assignments.push([
			new Ot.Stat.AxisValue.Variable(statAxisRond, min, nominal, max),
			new Ot.Stat.NameAssignment(flag | 0, pushNameEntry(name)),
		]);
}

function buildPVFMetaData(font, param) {
	const { subfamily, roundness } = param;
}

function makeInstanceNameTable(subfamily, weight, roundness) {
	const family = `${config.name.normal} ${subfamily}`;
	const psFamily = `${config.name.postscript}${subfamily}`;
	const sf = config.genSubfamilyName(weight, roundness);
	const isWws = roundness == 100;
	const result = [
		makeNameEntry(nameId.Copyright, config.copyright),
		makeNameEntry(nameId.LegacyFamily, sf.legacy[0] ? `${family} ${sf.legacy[0]}` : family),
		makeNameEntry(nameId.LegacySubfamily, sf.legacy[1]),
		makeNameEntry(nameId.UniqueFontId, `${config.vendor.name}: ${family} ${config.version.name}`),
		makeNameEntry(nameId.FullFontName, family),
		makeNameEntry(nameId.VersionString, `Version ${config.version.name}`),
		makeNameEntry(nameId.PostscriptName, `${psFamily}-${sf.postscript}`),
		makeNameEntry(nameId.Manufacturer, config.vendor.name),
		makeNameEntry(nameId.Designer, config.designer),
		makeNameEntry(nameId.UrlVendor, config.vendor.url),
		makeNameEntry(nameId.LicenseDescription, config.license.description),
		makeNameEntry(nameId.LicenseInfoUrl, config.license.url),
		makeNameEntry(nameId.PreferredFamily, family),
		makeNameEntry(nameId.PreferredSubfamily, sf.typo),
	];
	if (!isWws)
		result.push(
			makeNameEntry(nameId.WwsFamily, `${family} ${sf.wws[0]}`),
			makeNameEntry(nameId.WwsSubfamily, sf.wws[1]),
		);
	return result;
}

function buildInstanceMetaData(font, param) {
	const { subfamily, weight, roundness } = param;

	font.head.fontRevision = config.version.head;
	font.head.macStyle = weight == 700 ? Ot.Head.MacStyle.Bold : 0;

	font.os2.achVendID = config.vendor.id;
	font.os2.usWeightClass = weight;
	font.os2.fsSelection = Ot.Os2.FsSelection.USE_TYPO_METRICS | (roundness == 100 ? Ot.Os2.FsSelection.WWS : 0) | (weight == 700 ? Ot.Os2.FsSelection.BOLD : 0) | ((weight == 400 && roundness == 100) ? Ot.Os2.FsSelection.REGULAR : 0);

	font.name.records = makeInstanceNameTable(subfamily, weight, roundness);
}

module.exports = {
	buildVFMetaData,
	buildPVFMetaData,
	buildInstanceMetaData,
};
