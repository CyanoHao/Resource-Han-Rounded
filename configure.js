"use strict";

const config = {
	memory: 14, // per job, in GiB
	name: {
		normal: 'Resource Han Rounded',
		postscript: 'ResourceHanRounded',
	},
	version: {
		sfnt: 1.901,
		name: "1.901",
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
			// linear fit to ‘missing area’w
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
};

module.exports = {
	config: config,
};

function main() {
	const node = `node --max-old-space-size=${config.memory * 1024}`;
	const makeRule = {
		'.PHONY': {
			dependency: ['all', 'clean', 'cleanall', 'cff2-vf', 'cff1-instance'],
			rule: [],
		},
		'all': {
			dependency: ['cff2-vf', ],
			rule: [],
		},
		'clean': {
			dependency: [],
			rule: [ '-rm -r build/' ],
		},
		'cleanall': {
			dependency: ['clean'],
			rule: [ '-rm -r dist/' ],
		},
		'cff2-vf': {
			dependency: [],
			rule: [],
		},
		'cff1-instance': {
			dependency: [],
			rule: [],
		},
	};

	for (const subfamily of config.orthography.subfamily) {
		const cff2Filename = `build/cff2/ResourceHanRounded${subfamily}-VF.otf`;
		const shsFilename = `src/${config.orthography.shsMap[subfamily]}-VF.otf`;
		makeRule['cff2-vf'].dependency.push(cff2Filename);
		makeRule[cff2Filename] = {
			dependency: [shsFilename],
			rule: [
				'mkdir -p build/cff2/',
				`${node} script/main.js '${JSON.stringify({ subfamily })}'`,
			],
		}
	}

	for (const key in makeRule) {
		const value = makeRule[key];
		console.log(key, ':', ...value.dependency);
		for (const rule of value.rule)
			console.log(`\t${rule}`);
	}
}

if (require.main == module)
	main();
