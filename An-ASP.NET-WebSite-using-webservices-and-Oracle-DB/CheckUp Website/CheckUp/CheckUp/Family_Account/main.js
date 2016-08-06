function mobileCheck() {
	var winWidth = $(window).width();
	if (winWidth<640) {
		if (!$("body").hasClass("mobile-v")) {
			$(".ms-left .sub-page").each(function(index) {
				$(this).find(".logo").prependTo($(".ms-right .sub-page").eq(index))
			});
			$("body").addClass("mobile-v");
		};
	} else {
		if ($("body").hasClass("mobile-v")) {
			$(".ms-right .sub-page").each(function(index) {
				$(this).find(".logo").prependTo($(".ms-left .sub-page").eq(index))
			});
			$("body").removeClass("mobile-v");
		}
	}
}



$(document).ready(function() {
        
        $("video").prop("volume", 0);
        setTimeout(function(){ $('video').get(0).play(); }, 3000);
	
        var slides;
	$('#myContainer').multiscroll({
	    sectionsColor: ['#ffffff', '##2281be'],
		anchors: ['home', 'members', 'pending', 'services', 'careers', 'contact'],
		menu: '#scrolldown',
		onLeave: function () {
			if (location.hash == "#team") {
				$("body").addClass("light-color");
			} else {
				$("body").removeClass("light-color");
			};
			if (location.hash == "#careers") {
				$("body").addClass("light-color-careers");
			} else {
				$("body").removeClass("light-color-careers");
			};
			if (location.hash == "#contact") {
				$("body").addClass("light-color lights-color");
			} else {
				$("body").removeClass("light-color lights-color");
			};
			if (location.hash == "#services") {
				$("body").addClass("light-orange-color");
			} else {
				$("body").removeClass("light-orange-color");
			};
			$("body").removeClass("menu-open");
		},
		afterResize: function () {
			slides.reloadSlider();
		}
	});
	slides = $(".slides ul").bxSlider({
		mode: 'fade',
		auto:1,
		randomStart: 1,
		controls: false
	});
	$(".trigger").click(function() {
		$("body").toggleClass("menu-open");
	});
	/*
	$.cssLoader.show({
		useLayer: true,
		delay: 0,
		layerColor: '#fff',
		theme: 'dots'
	});
	*/
});

$(window).load(function() {
	mobileCheck();
	$(window).resize(function() {
		mobileCheck();
	});
	//$.cssLoader.hide();
});
