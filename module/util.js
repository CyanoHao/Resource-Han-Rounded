// round to 1/precision, where precision should be power of 2 to get smaller size
function roundTo(x, precision) {
	return Math.round(x * precision) / precision;
}

module.exports = {
	roundTo,
};
