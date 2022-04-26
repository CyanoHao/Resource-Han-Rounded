"use strict";

const { dirname } = require('path');

const config = {
	memory: 14, // per job, in GiB
	name: {
		normal: 'Resource Han Rounded',
		postscript: 'ResourceHanRounded',
		package: 'RHR',
	},
	version: {
		head: 1.910,
		name: "1.910",
	},
	vendor: {
		id: 'Cyan',
		name: 'Cyano Hao',
		url: 'https://github.com/CyanoHao',
	},
	designer: 'Cyano Hao (round all glyphs); Ryoko NISHIZUKA 西塚涼子 (kana, bopomofo & ideographs); Paul D. Hunt (Latin, Greek & Cyrillic); Sandoll Communications 산돌커뮤니케이션, Soo-young JANG 장수영 & Joo-yeon KANG 강주연 (hangul elements, letters & syllables)',
	copyright: "Copyright © 2018—2022 Cyano Hao. Portions © 2014-2021 Adobe (http://www.adobe.com/), with Reserved Font Name 'Source'.",
	license: {
		description: 'This Font Software is licensed under the SIL Open Font License, Version 1.1. This Font Software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the SIL Open Font License for the specific language, permissions and limitations governing your use of this Font Software.',
		url: 'https://scripts.sil.org/OFL',
	},
	orthography: {
		subfamily: [
			'J', 'K', 'SC', 'TC', 'HC',
			'JP', 'KR', 'CN', 'TW', 'HK',
		],
		shsMap: {
			'J': 'SourceHanSans',
			'K': 'SourceHanSansK',
			'SC': 'SourceHanSansSC',
			'TC': 'SourceHanSansTC',
			'HC': 'SourceHanSansHC',
			'JP': 'SourceHanSansJP',
			'KR': 'SourceHanSansKR',
			'CN': 'SourceHanSansCN',
			'TW': 'SourceHanSansTW',
			'HK': 'SourceHanSansHK',
		},
		ttc: ['J', 'K', 'SC', 'TC', 'HC'],
	},
	weight: {
		avar: [
			// follow shs values: same name, same weight
			[-1, -1],
			[0, 0],
			[1 / 7, 0.16],
			[2 / 7, 0.39],
			[3 / 7, 0.56],
			[1, 1],
		],
		instance: [200, 300, 350, 370, 400, 450, 500, 600, 700, 800, 900],
		nameMap: {
			200: 'ExtraLight',
			300: 'Light',
			350: 'SemiLight',
			370: 'Normal',
			400: null,
			450: 'Book',
			500: 'Medium',
			600: 'SemiBold',
			700: 'Bold',
			800: 'ExtraBold',
			900: 'Heavy',
		},
		stat: [
			[200, 200, 250, 'ExtraLight'],
			[250, 300, 325, 'Light'],
			[325, 350, 360, 'SemiLight'],
			[360, 370, 385, 'Normal'],
			[385, 400, 425, 'Regular', 2],
			[425, 450, 475, 'Book'],
			[475, 500, 550, 'Medium'],
			[550, 600, 650, 'SemiBold'],
			[650, 700, 750, 'Bold'],
			[750, 800, 850, 'ExtraBold'],
			[850, 900, 900, 'Heavy'],
		],
	},
	roundness: {
		avar: [
			// linear fit to ‘missing area’
			...new Array(100).fill(0).map((_, i) => [i * i / 10000 - 1, i / 100 - 1]),
			[0, 0],
			[1, 1],
		],
		instance: [20, 60, 100],
		nameMap: {
			20: 'SlightlyRounded',
			60: 'SemiRounded',
			100: null,
		},
		stat: [
			[0, 20, 40, 'SlightlyRounded'],
			[40, 60, 80, 'SemiRounded'],
			[80, 100, 100, 'FullyRounded', 2],
		],
	},
	genSubfamilyName: function (weight, roundness) {
		const typoSubfamily = [];
		const legacyFamily = [];
		const legacySubfamily = [];
		const roundnessName = config.roundness.nameMap[roundness];
		if (roundnessName) {
			typoSubfamily.push(roundnessName);
			legacyFamily.push(roundnessName);
		}
		const weightName = config.weight.nameMap[weight];
		if (weightName) {
			typoSubfamily.push(weightName);
			weight == 700 ? legacySubfamily.push(weightName) : legacyFamily.push(weightName);
		}
		return {
			typo: typoSubfamily.length ? typoSubfamily.join(' ') : 'Regular',
			postscript: typoSubfamily.length ? typoSubfamily.join('') : 'Regular',
			legacy: [legacyFamily.length ? legacyFamily.join(' ') : null, legacySubfamily.length ? legacyFamily.join(' ') : 'Regular'],
			wws: [roundnessName ? roundnessName : null, weightName ? weightName : 'Regular'],
		}
	},
};

const filename = {
	shs: subfamily => `src/${config.orthography.shsMap[subfamily]}-VF.otf`,
	cff2Vf: subfamily => `build/cff2/${config.name.postscript}${subfamily}-VF.otf`,
	cff2Otc: () => `build/cff2-otc/${config.name.postscript}-VF.ttc`,
	cff1Otf: (subfamily, weight, roundness) => `build/cff1/${config.name.postscript}${subfamily}-${config.genSubfamilyName(weight, roundness).postscript}.otf`,
	cff1FfIn: (subfamily, weight, roundness) => `build/cff1/${config.name.postscript}${subfamily}-${config.genSubfamilyName(weight, roundness).postscript}.in.otf`,
	cff1FfOut: (subfamily, weight, roundness) => `build/cff1/${config.name.postscript}${subfamily}-${config.genSubfamilyName(weight, roundness).postscript}.out.otf`,
	cff1Otc: (weight, roundness) => `build/cff1/${config.name.postscript}-${config.genSubfamilyName(weight, roundness).postscript}.otf`,
};

module.exports = {
	config: config,
	filename: filename,
};

function main() {
	const node = `node --max-old-space-size=${config.memory * 1024}`;
	const ttcize = `node node_modules/otb-ttc-bundle/bin/otb-ttc-bundle`;
	const sevenZip = `7z a -t7z -m0=LZMA:d=512m:fb=273 -ms`;
	const quick7z = `cp $^ $(shell dirname $@) ; cd $(shell dirname $@) ; ${sevenZip} $(shell basename $@) $(shell basename -a $^) ; rm $(shell basename -a $^)`;

	const makeRule = {
		'.PHONY': {
			dependency: [
				'all', 'clean', 'cleanall',
				'cff2-vf', 'cff2-otc', 'dist-cff2-otc', 'dist-cff2-otf', 'dist-cff2-subsetotf',
				'cff1-instance', 'cff1-otc', 'dist-cff1-otc', 'dist-cff1-otf', 'dist-cff1-subsetotf',
			],
			rule: [],
		},
		'all': {
			dependency: [
				'cff2-vf', 'cff2-otc', 'dist-cff2-otc', 'dist-cff2-otf', 'dist-cff2-subsetotf',
				'cff1-instance', 'cff1-otc', 'dist-cff1-otc', 'dist-cff1-otf', 'dist-cff1-subsetotf',
			],
			rule: [],
		},
		'clean': {
			dependency: [],
			rule: ['-rm -r build/'],
		},
		'cleanall': {
			dependency: ['clean'],
			rule: ['-rm -r dist/'],
		},
		'cff2-vf': {
			dependency: [],
			rule: [],
		},
		'dist-cff2-subsetotf': {
			dependency: [],
			rule: [],
		},
		'cff1-instance': {
			dependency: [],
			rule: [],
		},
		'cff1-otc': {
			dependency: [],
			rule: [],
		},
		'dist-cff1-subsetotf': {
			dependency: [],
			rule: [],
		},
	};

	// cff2-vf targets
	for (const subfamily of config.orthography.subfamily) {
		const cff2Filename = filename.cff2Vf(subfamily);
		const shsFilename = filename.shs(subfamily);
		makeRule['cff2-vf'].dependency.push(cff2Filename);
		makeRule[cff2Filename] = {
			dependency: [shsFilename],
			rule: [`${node} script/main.js '${JSON.stringify({ subfamily })}'`],
		};
	}

	// dist-cff2-subsetotf targets
	for (const subfamily of config.orthography.subfamily.filter(
		e => config.orthography.ttc.indexOf(e) == -1
	)) {
		const packFilename = `dist/cff2-subsetotf/${config.name.package}-CFF2-${subfamily}-${config.version.name}.7z`;
		const cff2Filename = filename.cff2Vf(subfamily);
		makeRule['dist-cff2-subsetotf'].dependency.push(packFilename);
		makeRule[packFilename] = {
			dependency: [cff2Filename],
			rule: [quick7z],
		};
	}

	// cff1-instance targets
	for (const subfamily of config.orthography.subfamily)
		for (const weight of config.weight.instance)
			for (const roundness of config.roundness.instance) {
				const cff1Filename = filename.cff1Otf(subfamily, weight, roundness);
				const cff2Filename = filename.cff2Vf(subfamily);
				makeRule['cff1-instance'].dependency.push(cff1Filename);
				makeRule[cff1Filename] = {
					dependency: [cff2Filename],
					rule: [`${node} script/instance.js '${JSON.stringify({ subfamily, weight, roundness })}'`],
				};
			}

	// cff1-otc targets
	for (const weight of config.weight.instance)
		for (const roundness of config.roundness.instance) {
			const otcFilename = filename.cff1Otc(weight, roundness);
			makeRule['cff1-instance'].dependency.push(otcFilename);
			makeRule[otcFilename] = {
				dependency: config.orthography.ttc.map(o => filename.cff1Otf(o, weight, roundness)),
				rule: [`${ttcize} -o $@ $^`],
			};
		}

	// dist-cff1-subsetotf targets
	for (const subfamily of config.orthography.subfamily.filter(
		e => config.orthography.ttc.indexOf(e) == -1
	)) {
		const packFilename = `dist/cff1-subsetotf/${config.name.package}-CFF1-${subfamily}-${config.version.name}.7z`;
		const otfFilenames = config.weight.instance.map(
			w => config.roundness.instance.map(
				r => filename.cff1Otf(subfamily, w, r)
			)
		).flat(1);
		makeRule['dist-cff2-subsetotf'].dependency.push(packFilename);
		makeRule[packFilename] = {
			dependency: otfFilenames,
			rule: [quick7z],
		};
	}

	function makeFriendlyRule(friendlyName, filename, dependency, rule) {
		makeRule[friendlyName] = {
			dependency: [filename],
			rule: [],
		};
		makeRule[filename] = {
			dependency: dependency,
			rule: rule,
		};
	}

	makeFriendlyRule(
		'cff2-otc',
		filename.cff2Otc(),
		config.orthography.ttc.map(o => filename.cff2Vf(o)),
		[`${ttcize} -o $@ $^`],
	);

	makeFriendlyRule(
		'dist-cff2-otc',
		`dist/cff2-otc/${config.name.package}-CFF2-OTC-${config.version.name}.7z`,
		[filename.cff2Otc()],
		[quick7z],
	);

	makeFriendlyRule(
		'dist-cff2-otf',
		`dist/cff2-otf/${config.name.package}-CFF2-OTF-${config.version.name}.7z`,
		config.orthography.ttc.map(o => filename.cff2Vf(o)),
		[quick7z],
	);

	makeFriendlyRule(
		'dist-cff1-otc',
		`dist/cff1-otc/${config.name.package}-CFF1-OTC-${config.version.name}.7z`,
		config.weight.instance.map(
			w => config.roundness.instance.map(
				r => filename.cff1Otc(w, r)
			)
		).flat(1),
		[quick7z],
	)

	makeFriendlyRule(
		'dist-cff1-otf',
		`dist/cff1-otf/${config.name.package}-CFF1-OTF-${config.version.name}.7z`,
		config.weight.instance.map(
			w => config.roundness.instance.map(
				r => config.orthography.ttc.map(
					o => filename.cff1Otf(o, w, r)
				)
			)
		).flat(2),
		[quick7z],
	)

	// dump Makefile
	for (const key in makeRule) {
		const value = makeRule[key];
		console.log(key, ':', ...value.dependency);
		const targetDir = dirname(key);
		if (targetDir != '.')
			console.log(`\tmkdir -p ${targetDir}`);
		for (const rule of value.rule)
			console.log(`\t${rule}`);
	}
}

if (require.main == module)
	main();
