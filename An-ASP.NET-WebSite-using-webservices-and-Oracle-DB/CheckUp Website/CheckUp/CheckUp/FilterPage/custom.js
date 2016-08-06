$(function() {
     // notification close
			$('.notification .close').on('click', function(){
				var $notification = $('.notification');
				$notification.slideUp();

				// Remember that for a year
				var date = new Date();
				date.setTime(date.getTime()+31536000000); // 360*24*60*60*1000
				document.cookie = 'hideBoomNotification='+$notification.data('id')+'; expires='+date.toGMTString()+'; path=/';
			});


    // top menu popup
			$('.header nav > ul > li').hover(function () {
			    $(this).find('> ul').stop(true, true).slideDown();
			    }, function() {
			    $(this).find('> ul').stop(true, true).slideUp();
			});


    // main slider
			$('.main_slider ul').bxSlider({
			    mode: 'fade',
			    controls: false,
			    auto: true
			});


    // tooltips popup / donate checkbox/input selection
			$('.problems_block ul > li, .donate_block ul.step_1 > li').hover(function () {
			    $(this).find('> div').stop(true, true).fadeIn();
			    }, function() {
			    $(this).find('> div').stop(true, true).fadeOut();
			});

    		$(".donate_block .step_1 input[type='text']").on('click', function(){
	   				$('.donate_block .step_1 input[type="radio"] + label').removeClass('checked');
	   				$('.donate_block .step_1 input[type="radio"]').attr('checked',false);
    		});


    // solution tabs
			$('.solutions_tabs .tab_content').hide();
			$('.solutions_tabs .tab_content:first-of-type').show();
			$('.solutions_tabs .tab_select li:first-child').addClass('active');
			$('.solutions_tabs .tab_select li a').click(function(){
					$(this).parent().parent().find('li').removeClass('active');
					$(this).parent().addClass('active');
					var currentTab = $(this).attr('href');
					$(this).parent().parent().parent().find('.tab_content').hide();
					$(currentTab).show();
					$(currentTab).find('p').hide().fadeIn();
					$(currentTab).find('h6').hide().fadeIn();
					return false;
			});

			$('.solutions_tabs .tab_content .close').on('click', function(){
				$(this).parent().fadeOut();
			});

			if( $(window).width() < 767)
			{
				$('.solutions_tabs .tab_content:first-of-type').hide();
			$('.solutions_tabs .tab_select li:first-child').removeClass('active');
			};


    // Show/hide input value
			$('input[type="text"], input[type="password"], input[type="email"]').each(function(){
				var valtxt = $(this).attr('value');
				$(this).focus(function() { if ($(this).val() == valtxt) {$(this).val('');} });
				$(this).blur(function() { if ($(this).val() == '') {$(this).val(valtxt);} });
			});


    // Responsive menu trigger
			if( $(window).width() < 160)
			{
				$(".menu_trigger").on('click', function(){
					$(this).parent().find('nav').toggle();
				});
			};


	// Toggle checkbox (old ie fix)
			$('input[type="checkbox"]:checked + label').addClass('checked');
			$('input[type="checkbox"] + label').on('click', function(){
				$(this).toggleClass('checked');
			});


	// Custom select
			$("select:not(.press select)").select2({width:"element"});


	// Problem details select
			if( $(window).width() < 1199)
			{
				var active_select = $('.problems_details ul .active').clone();
				$('.problems_details ul .active').hide();
				$('.problems_details ul').prepend(active_select);
				$('.problems_details ul').on('click', function(){
					$(this).toggleClass('active');
				});
			};


	// Problems page related solutions for tablet/mobile
			var active_select = $('.problems_desc aside').clone();
			$('.problems_desc .wrapper').append(active_select);


    // about slider
			$('.about_slider ul').bxSlider({
			  minSlides: 6,
			  maxSlides: 6,
			  slideWidth: 270,
			  slideMargin: 0,
			  ticker: true,
			  speed: 27000
  			});


    // solutions detail slider
			$('.sol_det_slider ul').bxSlider({
			    mode: 'fade',
			    slideWidth: 350,
			    controls: false,
			    auto: true
			});


    // solutions detail slider
			$('.news_slider ul').bxSlider({
			    mode: 'fade',
			    slideWidth: 560,
			    controls: false,
			    auto: true
			});


    // news equal columns
			if( $(window).width() > 768)
			{
				var max_height = 0;
				$(".internal_news, .social_news").each(function(){
			    	if ($(this).height() > max_height) { max_height = $(this).height(); }
				});
				$(".internal_news, .social_news").height(max_height);
			};


    // press scrollbar
		   	$('.scroll_block').customScrollbar();


    // press change articles/year
    		$(".social_news .press select").change(function(){
    			if ( $(this).val() == '2013' ) {
	   				$('.social_news .press ul').removeClass('active');
	   				$('.press_2013').addClass('active');
	   				$('.scroll_block').customScrollbar();
	            } else if ( $(this).val() == '2012' ) {
	   				$('.social_news .press ul').removeClass('active');
	   				$('.press_2012').addClass('active');
	   				$('.scroll_block').customScrollbar();
	            } else if ( $(this).val() == '2011' ) {
	   				$('.social_news .press ul').removeClass('active');
	   				$('.press_2011').addClass('active');
	   				$('.scroll_block').customScrollbar();
		        }
    		});


	// donate shipping info
			$('.donate_block ul.step_2 input#tshirt_alt_address').on('click', function(){
				$('.donate_block ul.step_2 > li.shipping').slideToggle(600);
			});


	// thumbnail slider
			$('.thumb_slider').bxSlider({
			  pagerCustom: '#thumb-pager',
			  mode: 'fade',
			  controls: false
			});
		   	$('#thumb-pager').customScrollbar();
			$(".fancybox-thumb").fancybox({
				padding    : 0,
		        margin     : 25,
		        afterLoad  : function () {
		            $.extend(this, {
		                aspectRatio : false,
		                type    : 'html',
		                width   : '100%',
		                height  : '100%',
		                content : '<div class="fancybox-image" style="background-image:url(' + this.href + '); background-size: cover; background-position:50% 50%;background-repeat:no-repeat;height:100%;width:100%;" /></div>'
		            });
		        },
				prevEffect	: 'none',
				nextEffect	: 'none',
				helpers	: {
					title	: {
						type: 'outside'
					},
					thumbs	: {
						width	: 50,
						height	: 50
					}
				}
			});

	// Tablet menu
			$(".tablet_menu").hide();
			var top_menu = $('.header nav').clone();
			var top_social = $('.header .social_list').clone();
			$('.tablet_menu').html(top_menu).append(top_social);
			$(".tablet_menu nav > ul > li:not(:last-child) > a").on('click', function(){
				$(this).parent().toggleClass('active').find('> ul').slideToggle();
				return false;
			});
			if( $(window).width() > 768)
			{
					var menuStatus;
					$(".menu_trigger, .social_list .close, .close_trigger").on('click', function(){
						if(menuStatus != true){
						$(".close_trigger").show();
						$(".tablet_menu").show().animate({
							right: "0",
						  }, 300, function(){menuStatus = true});
						$(".main_wrapper").animate({
							left: "-40%",
						  }, 300, function(){menuStatus = true});
						  return false;
						  } else {
							$(".close_trigger").hide();
							$(".tablet_menu").hide().animate({
							right: "-40%",
						  }, 300, function(){menuStatus = false});
						$(".main_wrapper").animate({
							left: "0",
						  }, 300, function(){menuStatus = false});
							return false;
						  }
					});
			} else {
					var menuStatus;
					$(".menu_trigger, .social_list .close, .close_trigger").on('click', function(){
						if(menuStatus != true){
						$(".close_trigger").show();
						$(".tablet_menu").show().animate({
							right: "0",
						  }, 300, function(){menuStatus = true});
						$(".main_wrapper").animate({
							left: "-80%",
						  }, 300, function(){menuStatus = true});
						  return false;
						  } else {
							$(".close_trigger").hide();
							$(".tablet_menu").hide().animate({
							right: "-80%",
						  }, 300, function(){menuStatus = false});
						$(".main_wrapper").animate({
							left: "0",
						  }, 300, function(){menuStatus = false});
							return false;
						  }
					});
			};

});


// Tablet menu portrait/landscape
window.addEventListener("orientationchange", function() {
			if( $(window).width() > 768)
			{
						$(".tablet_menu").hide().animate({
							right: "-40%",
						  }, 300, function(){menuStatus = false});
						$(".main_wrapper").animate({
							left: "0",
						  }, 300, function(){menuStatus = false});
			} else {
						$(".tablet_menu").hide().animate({
							right: "-80%",
						  }, 300, function(){menuStatus = false});
						$(".main_wrapper").animate({
							left: "0",
						  }, 300, function(){menuStatus = false});
			};
}, false);


// Main page problem animation
function getScrollTop(){
        if(typeof pageYOffset!= 'undefined'){
          return pageYOffset;
        }
        else{
          var b = document.body;
          var d = document.documentElement;
          d = (d.clientHeight)? d : b;
          return d.scrollTop;
        }
      }

   /*   $(window).on("scroll", function(){
        if(getScrollTop() >= 800){
          $(window).off("scroll");

          $('.problems_block ul li:first-child').addClass('active');
          setTimeout(function(){
	          $('.problems_block ul li:nth-child(2)').addClass('active');
          }, 0);
          setTimeout(function(){
	          $('.problems_block ul li:nth-child(3)').addClass('active');
          }, 0);
          setTimeout(function(){
	          $('.problems_block ul li:nth-child(4)').addClass('active');
          }, 0);
          setTimeout(function(){
	          $('.problems_block ul li:nth-child(5)').addClass('active');
          }, 0);
          setTimeout(function(){
	          $('.problems_block ul li:nth-child(6)').addClass('active');
          }, 0);
          setTimeout(function(){
	          $('.problems_block ul li:nth-child(7)').addClass('active');
          }, 0);
          setTimeout(function(){
	          $('.problems_block ul li').addClass('showtit');
          }, 0);

        };
      });
*/

// Press/thumbnail scrollbar on browser/orientation change
window.addEventListener("orientationchange", function() {
	$('.scroll_block').customScrollbar();
   	$('#thumb-pager').customScrollbar();
}, false);
window.addEventListener("resize", function() {
	$('.scroll_block').customScrollbar();
   	$('#thumb-pager').customScrollbar();
}, false);
