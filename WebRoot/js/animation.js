$(document).ready(function() {
		$('#slides').slides({
			preload : true,
			preloadImage : 'images/ajax-loader.gif',
			effect : 'slide',
			play : 5000,
			pause : 2500,
			hoverPause : true,
			animationStart : function(current) {
				$('.caption').animate({
					bottom : 0,
					right : 40,
					opacity : 0
				}, 200);
			},
			animationComplete : function(current) {
				$('.caption').animate({
					bottom : 20,
					right : 40,
					opacity : 1
				}, 200);
			},
			slidesLoaded : function() {
				$('.caption').animate({
					bottom : 20,
					right : 40,
					opacity : 1
				}, 200);
			}
		});
	});