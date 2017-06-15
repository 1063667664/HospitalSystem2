$(function() {
		$("#Verify").click(
				function() {
					$(this).attr(
							"src",
							"SecurityCodeImageAction?timestamp="
									+ new Date().getTime());
				});
	});