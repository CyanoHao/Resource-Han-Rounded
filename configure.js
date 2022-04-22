const config = {
	weight: {
		instance: [200, 300, 350, 372, 400, 450, 500, 600, 700, 800, 900],
		nameMap: {
			200: 'ExtraLight',
			300: 'Light',
			350: 'SemiLight',
			372: 'Normal',
			400: '',
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
			[325, 350, 375, 'SemiLight'],
			[375, 400, 450, 'Regular', 2],
			[450, 500, 550, 'Medium'],
			[550, 600, 650, 'SemiBold'],
			[650, 700, 750, 'Bold'],
			[750, 800, 850, 'ExtraBold'],
			[850, 900, 900, 'Heavy'],
		],
	},
	roundness: {
		instance: [100],
		nameMap: {                   // ‘missing area’
			0: 'Not-Rounded',        // 0
			50: 'Slightly-Rounded',  // 1/4
			70.7: 'Semi-Rounded',    // 1/2
			100: 'Fully-Rounded',    // 1
		},
		stat: [
			[0, 0, 35.4, 'Not-Rounded'],
			[35.4, 50, 61.2, 'Slightly-Rounded'],
			[61.2, 70.7, 86.6, 'Semi-Rounded'],
			[86.6, 100, 100, 'Fully-Rounded', 2],
		],
	},
};

module.exports = {
	config: config,
};

function main() {
}

if (require.main == module)
	main();
