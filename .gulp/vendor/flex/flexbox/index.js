module.exports = flexbox;

function flexbox(details) {
	var index = -1;
	var child;

	// for each flex child
	while (child = details.children[++index]) {
		// process child styles as metrics
		require('./flex-direction/index')(child, details.style.flexDirection);
	}

	// process target styles as metrics
	require('./flex-direction/index')(details, details.style.flexDirection);

	// process ordering of items
	require('./order/index')(details);

	// process flexbox items into lines
	require('./flexbox-lines/index')(details);

	// process align-content item metrics
	require('./align-content/index')(details);

	index = -1;
	var line;

	// for each line of items in the target
	while (line = details.lines[++index]) {
		line.mainSpace = details.flexStyle.main - details.flexStyle.mainInnerBefore - details.flexStyle.mainInnerAfter - details.flexStyle.mainBorderBefore - details.flexStyle.mainBorderAfter - line.main;

		// process flex-grow item metrics
		require('./flex-grow/index')(line);

		// process flex-shrink item metrics
		require('./flex-shrink/index')(line);

		// process margin item metrics
		require('./margin-main/index')(line);
		require('./margin-cross/index')(line);

		// process justify-content item metrics
		require('./justify-content/index')(line, details.style.justifyContent, details);
	}

	// process align-items metrics
	require('./align-items/index')(details);
}
