// Delegate .transition() calls to .animate() if the browser can't do CSS transitions
// don't forget to give alternates for x, y, and easing
if (!$.support.transition) $.fn.transition = $.fn.animate;

// jQuery.browser.mobile (http://detectmobilebrowser.com/)
// jQuery.browser.mobile will be true if the browser is a mobile device
(function(a){(jQuery.browser=jQuery.browser||{}).mobile=/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4));})(navigator.userAgent||navigator.vendor||window.opera);

// dont muck up the global namespace
var ookla = (function() {

	// put QueryString into an object
	var QueryString = {};
	window.location.search.replace(
		new RegExp('([^?=&]+)(=([^&]*))?', 'g'),
		function($0, $1, $2, $3) { QueryString[$1] = $3; }
		);

	// only do the map stuff on the pages that need it
	if ( $('.map-container').length ) {

		$('.js-homepage-map-toggle').on('click', function () {
			var $toggle = $(this),
				$mapContainer = $('.section-map');

			if ($mapContainer.hasClass('section-map-collapsed')) {
				$mapContainer.transition({ height: 571 });
			} else {
				$mapContainer.transition({ height: 0 });
			}

			$toggle.toggleClass('is-active');
			$mapContainer.toggleClass('section-map-collapsed');
		});

		var map = (function() {

			var settings = {
				loops: 0,
				subdomain: 'www',
				protocol: '//',
				feedurl: '.speedtest.net/globe_feed.php?mode=json&callback=?',
				// settings for individual data sources
				sources: [
					// broadband
					{ urlparam: '',           color: '246, 79, 24',  burstcolor: '255, 108, 0',  lastindex: 0, canvas: [0, 1] },
					// iphone
					{ urlparam: '&iphone=1',  color: '237, 180, 47', burstcolor: '255, 216, 0', lastindex: 0, canvas: [0, 2] },
					// android
					{ urlparam: '&android=1', color: '237, 180, 47', burstcolor: '255, 216, 0', lastindex: 0, canvas: [0, 2] },
					// windows phone
					{ urlparam: '&wp=1',      color: '237, 180, 47', burstcolor: '255, 216, 0', lastindex: 0, canvas: [0, 2] }
				],
				// canvas controls (first one is "everything" canvas)
				canvases: {
					disabled: false,
					canvas: [
						{ active: true },
						{ active: true, label: 'Broadband', description: '<span class="count-broadband"></span> Tests Per Hour', classname: 'broadband' },
						{ active: true, label: 'Mobile',    description: '<span class="count-mobile"></span> Tests Per Hour', classname: 'mobile' }
					]
				},
				// feed refresh interval
				refresh: 60 * 1000,
				// width and height of canvas
				width: 932,
				height: 473,
				counts: {
					broadband: 0,
					mobile: 0
				},
				// for calculation purposes, use height, but the canvas and the container are actually fakeheight (no antarctica)
				fakeheight: 423,
				// only allow approximately this many spans to animate at once (approx because of shuffle)
				dots: {
					limit: 50,
					max: 100,
					min: 10,
					total: 0
				},
				// ease function for drop
				ease: {
					drop: 'cubic-bezier(0, 0, .5, 0)',
					burst: 'ease'
				},
				// animation speeds... higher numbers = slower animations = higher percentage of dots skipped
				speed: {
					drop: 2000,
					burst: 500
				},
				opacity: { dot: 0.7, plot: 0.3 },
				servers: {
					drawn: false,
					urlparam: '&loadservers=1&dailycount=1',
					halocolor: '0,192,0',
					dotcolor: '0,255,0',
					halowidth: 1,
					dotwidth: 1.25
				}
			};

			if (!$.support.transition) {
				settings.ease.drop = 'easeInSine';
				settings.ease.burst = 'easeOutQuart';
			}

			// change to dev.speedtest.net if running on dev.ookla.com
			if ( window.location.host.split('.')[0] == 'dev' ) { settings.subdomain = 'dev'; }

			// assemble each source url
			$.each(settings.sources, function(i, source) {
				source.url = settings.protocol + settings.subdomain + settings.feedurl + source.urlparam;
			});
			settings.servers.url = settings.protocol + settings.subdomain + settings.feedurl + settings.servers.urlparam;

			// assume 0 for some settings if they aren't numbers. 0 disables the animation in question
			//settings.dots.limit = parseInt(settings.dots.limit, 10) || 0;
			settings.speed.drop = parseInt(settings.speed.drop, 10) || 0;
			settings.speed.burst = parseInt(settings.speed.burst, 10) || 0;

			var limitcalc = { count: 0, total: 0 };
			var receiveddata = false;
			var dots = 0;
			var $mapcontainer = $('.map-container');
			var $mapcaption = $('.map-caption');
			var $mapcontrols = $('.map-controls');
			var $dots = $mapcontainer.find('.dots');
			$mapcontainer.css( { 'width': settings.width, 'height': settings.fakeheight } );

			// create canvas elements, 1 for broadband, 1 for mobile, 1 for both
			var $canvases = $('.canvases');
			var mapcontrolgroup = '<div class="map-control-group">';
			for ( var i = 0; i < settings.canvases.canvas.length; i++ ) {
				settings.canvases.canvas[i].jq = $('<canvas class="canvas canvas-' + i + '"/>');
				settings.canvases.canvas[i].el = settings.canvases.canvas[i].jq.get(0);
				settings.canvases.canvas[i].ctx = settings.canvases.canvas[i].el.getContext('2d');
				// TODO: do you need to set the width of both the jq and the el?
				settings.canvases.canvas[i].jq.css( { 'width': settings.width, 'height': settings.fakeheight } );
				settings.canvases.canvas[i].el.width = settings.width;
				settings.canvases.canvas[i].el.height = settings.fakeheight;
				$canvases.append( settings.canvases.canvas[i].jq );
				// the first canvas is the "everything" canvas, so skip it
				if (i > 0) {
					mapcontrolgroup += '<div class="key-row">';
					mapcontrolgroup += '<div class="key-main"><a href="#" data-canvas="' + i + '" class="control-canvas control-' + settings.canvases.canvas[i].classname + '">';
					mapcontrolgroup += '<span class="key-dot"></span> ' + settings.canvases.canvas[i].label + '</a></div>';
					mapcontrolgroup += '<div class="key-secondary">' + settings.canvases.canvas[i].description + '</div>';
					mapcontrolgroup += '</div>';
				}
			}
			mapcontrolgroup += '</div>';
			$mapcontrols.prepend($(mapcontrolgroup));
			// cache count elements
			var $count = {};
			$count.broadband = $('.count-broadband');
			$count.mobile = $('.count-mobile');
			$count.servers = $('.count-servers');
			$count.pastday = $('.count-pastday');

			// bind events and logic to map controls
			$mapcontrols.on('click touchstart', '.key-main a', function(e) {
				e.preventDefault();
				var $this = $(this);
				var $thisgroup = $this.closest('.map-control-group');
				var $othergroups = $this.closest('.map-controls').find('.map-control-group').not($thisgroup);
				var canvas = $this.data('canvas');
				if ($thisgroup.hasClass('group-disabled')) {
					$thisgroup.removeClass('group-disabled');
					$othergroups.addClass('group-disabled');
					settings.canvases.disabled = !$this.hasClass('control-canvas');
				} else {
					if ( $this.hasClass('control-canvas') ) {
						var clickedindex = $this.data('canvas');
						settings.canvases.canvas[clickedindex].active = !settings.canvases.canvas[clickedindex].active;
						$this.toggleClass('control-off');
					}
				}
				if ( $this.hasClass('control-canvas') ) {
					var activearray = $.map( settings.canvases.canvas, function(canvas, i) {
						if (i > 0) {
							return canvas.active;
						}
					});
					var canvasindex = 0;
					switch( activearray.toString() ) {
						case [true, true].toString():
							canvasindex = 0;
							break;
						case [true, false].toString():
							canvasindex = 1;
							break;
						case [false, true].toString():
							canvasindex = 2;
							break;
						default:
							break;
					}
					canvas = canvasindex;
				}
				showCanvas( canvas );
			});

			function showCanvas(canvas) {
				var $show = $canvases.find('.canvas-' + canvas);
				$canvases.find('.canvas').not($show).fadeOut();
				$show.fadeIn();
			}

			// weed out tests that have already been processed and add xy plot data
			function prepareData(tests, source) {
				tests = $.map( tests, function( test, i ) {
					// don't include tests that have already been processed, or tests with 0/0 lat/lon (totals will be slightly off, but oh well)
					if (test.id > settings.sources[source].lastindex && test.lat !== 0 && test.lon !== 0) {
						test.source = source;
						test.canvas = settings.sources[source].canvas;
						test.speed_rating = parseInt(test.speed_rating, 10);
						settings.sources[source].lastindex = test.id;
						return test;
					}
				});
				return tests;
			}

			// plot the landing spot on the canvas
			function dotCanvas(plot) {
				for ( var i = 0; i < plot.canvas.length; i++ ) {
					var ctx = settings.canvases.canvas[ plot.canvas[i] ].ctx;
					ctx.beginPath();
					ctx.arc(plot.cx, plot.cy, 1, Math.PI*2, false);
					ctx.closePath();
					ctx.fillStyle = 'rgba(' + settings.sources[plot.source].color + ', ' + settings.opacity.plot + ')';
					ctx.fill();
				}
			}

			// figure out the xy on the canvas based on the lat/lon
			// TODO: the map is not centered, so any tests taking place in the eastern tip of russia will render on the left rather than on the right
			function getXY(obj, settings) {
				var lon = parseFloat(obj.lon);
				var lat = parseFloat(obj.lat);
				var cx = (settings.width / 360.0) * (180 + lon);
				var cy = (settings.height / 180.0) * (90 - lat);
				cx = parseInt(cx, 10);
				cy = parseInt(cy, 10);
				// make sure you don't draw the dot off the bottom of the canvas
				cy = Math.min(cy, settings.fakeheight);
				obj.cx = cx;
				obj.cy = cy;
				if ( !obj.hasOwnProperty('server_count') ) {
					obj = getStartingPoint(obj, settings);
				}
				return obj;
			}

			// figure out xy's starting position (nearest point on an oval around the canvas)
			function getStartingPoint(obj, settings) {
				var ratio = 1.3;
				var rx = settings.width / 2 * ratio;
				var ry = settings.height / 2 * ratio;
				var cx = settings.width / 2;
				var cy = settings.height / 2;
				var vx = obj.cx - cx;
				var vy = obj.cy - cy;
				var magv = Math.sqrt(vx*vx + vy*vy);
				// handles lat/lon of 0 (divide by 0)
				if (magv > 0) {
					obj.ax = cx + vx / magv * rx;
					obj.ay = cy + vy / magv * ry;
				} else {
					obj.ax = 0;
					obj.ay = 0;
				}
				return obj;
			}

			// shuffle array
			// from: http://bost.ocks.org/mike/shuffle/
			function shuffle(array) {
				var m = array.length, t, i;
				// While there remain elements to shuffle...
				while (m) {
					// Pick a remaining element...
					i = Math.floor(Math.random() * m--);
					// And swap it with the current element.
					t = array[m];
					array[m] = array[i];
					array[i] = t;
				}
				return array;
			}

			function getServers() {
				// TODO: store the jq and the el in the settings object like you do with the other canvas elements
				var $c = $('.canvas-servers');
				var ctx = $c.get(0).getContext('2d');
				$c.css( { 'width': settings.width, 'height': settings.fakeheight } );
				$c.get(0).width = settings.width;
				$c.get(0).height = settings.fakeheight;
				// build server canvas
				$.getJSON( settings.servers.url, function(data) {
					var d = new Date().getTime();
					var pi2 = Math.PI*2;
					var servercount = 0;
					var pastday = data.daily_count;
					$.each( data.servers, function( i, server ) {
						server.server_count = parseInt(server.server_count, 10);
						servercount += server.server_count;
						var dot  = settings.servers.dotwidth;
						var halo = (dot * 3) + (server.server_count * settings.servers.halowidth);
						server = getXY(server, settings);
						var grd = ctx.createRadialGradient( server.cx, server.cy, dot, server.cx, server.cy, halo );
						grd.addColorStop(1, 'rgba(' + settings.servers.halocolor + ', 0.2)');
						grd.addColorStop(0, 'rgba(' + settings.servers.halocolor + ', 0)');
						ctx.beginPath();
						ctx.arc(server.cx, server.cy, halo, pi2, false);
						ctx.closePath();
						ctx.fillStyle = grd;
						ctx.fill();
						ctx.beginPath();
						ctx.arc(server.cx, server.cy, dot, pi2, false);
						ctx.closePath();
						ctx.fillStyle = 'rgba(' + settings.servers.dotcolor + ', 1)';
						ctx.fill();
					});
					$count.servers.text( addCommas(servercount) );
					$count.pastday.text( addCommas(pastday) );
					console.log('drawing ' + data.servers.length + ' server plots took ' + (new Date().getTime() - d) + ' milliseconds');
				});
				settings.servers.drawn = true;
			}

			// doin thangs
			function process() {
				settings.loops++;
				console.log('Processing loop ' + settings.loops);
				// draw the servers if they haven't been drawn yet
				if (!settings.servers.drawn) { setTimeout( getServers, 5000); }
				// get all the feeds
				$.when(
					$.getJSON( settings.sources[0].url ),
					$.getJSON( settings.sources[1].url ),
					$.getJSON( settings.sources[2].url ),
					$.getJSON( settings.sources[3].url )
				).then( function( a, b, c, d ) {
					// process and combine results of the feeds
					var plots = [];
					// prepare each test with plot data, weeding out those that have already been processed, and combine into one array
					// make sure returned data is an array, the first element isn't null, and it has the property we expect
					settings.counts.mobile = 0;
					if ( $.isArray(a) ) { if ( a[0] ) { if ( a[0].hasOwnProperty('tests') ) {
						settings.counts.broadband = a[0].tests.length;
						plots = plots.concat( prepareData(a[0].tests, 0) );
						console.log('    broadband: ' + a[0].tests.length);
					} } }
					if ( $.isArray(b) ) { if ( b[0] ) { if ( b[0].hasOwnProperty('tests') ) {
						settings.counts.mobile += b[0].tests.length;
						plots = plots.concat( prepareData(b[0].tests, 1) );
						console.log('       iphone: ' + b[0].tests.length);
					} } }
					if ( $.isArray(c) ) { if ( c[0] ) { if ( c[0].hasOwnProperty('tests') ) {
						settings.counts.mobile += c[0].tests.length;
						plots = plots.concat( prepareData(c[0].tests, 2) );
						console.log('      android: ' + c[0].tests.length);
					} } }
					if ( $.isArray(d) ) { if ( d[0] ) { if ( d[0].hasOwnProperty('tests') ) {
						settings.counts.mobile += d[0].tests.length;
						plots = plots.concat( prepareData(d[0].tests, 3) );
						console.log('windows phone: ' + d[0].tests.length);
					} } }
					// obviously this count isn't exact
					$count.broadband.text(addCommas(settings.counts.broadband * 60));
					$count.mobile.text(addCommas(settings.counts.mobile * 60));
					// shuffle plots so the sources aren't all lumped together
					return shuffle(plots);
				}).done( function( plots ) {
					// capture canvas to img
					// $('<img class="cap">').attr('src', $('.canvas-0').get(0).toDataURL("image/png") ).appendTo('.map-container');
					// if we receive data even once, show the map controls
					if (plots.length && !receiveddata) {
						receiveddata = true;
					}
					settings.dots.total = plots.length;
					// space out rendering of plots over the next settings.refresh time period
					$.each(plots, function(i, plot) {
						// space out the span animations evenly over the next settings.refresh amount of time
						setTimeout( function() {
							// add plot data
							plot = getXY(plot, settings);
							// only animate a certain number of dots at a time
							if (Math.random() > (settings.dots.limit * ( settings.refresh / (settings.speed.drop + settings.speed.burst) ) / settings.dots.total)) {
								setTimeout( function() {
									dotCanvas(plot);
								}, settings.speed.drop);
							} else {
								// don't create the span if that canvas is turned off or disabled
								if ( settings.canvases.canvas[plot.canvas[1]].active && !settings.canvases.disabled && !$.browser.mobile ) {
									// create and append span
									var $span = $('<span class="map-dot" />');
									$span.css('background', 'rgb(' + settings.sources[plot.source].color + ')');
									$span.data('starttime', new Date().getTime());
									$span.appendTo($dots);
									// move span into starting position (TODO: possibly cheaper to do this before append?)
									$span.transition((($.support.transition) ? { x: plot.ax, y: plot.ay, scale: 0.1 } : { left: plot.ax, top: plot.ay, scale: 0.1 }), 0);
									// move the span
									$span.transition((($.support.transition) ? { x: plot.cx, y: plot.cy, opacity: settings.opacity.dot, scale: 0.05 } : { left: plot.cx, top: plot.cy, opacity: settings.opacity.dot, scale: 0.05 }), settings.speed.drop, settings.ease.drop, function() {
										dotCanvas(plot);
										// explode
										// burst size can range from 0.25 (speed_rating: 1) to 1.15 (speed_rating: 10)
										$span.transition({ scale: 0.25 + ((plot.speed_rating - 1) / 10), opacity: 0, background: settings.sources[plot.source].burstcolor }, settings.speed.burst, settings.ease.burst, function() {
											var $this = $(this);
											// adjust limit on the fly
											// get the average animation delay of the last 10 dots
											limitcalc.count++;
											limitcalc.elapsed += new Date().getTime() - $this.data('starttime');
											if (limitcalc.count % 10 === 0) {
												var elapsed = Math.round(limitcalc.elapsed / limitcalc.count);
												// subtract the desired animation time from the actual animation time to get the animation delay
												// if the delay is > 40ms, drop the limit, otherwise raise the limit
												// this will result in a constantly fluctuating limit
												if (elapsed - (settings.speed.drop + settings.speed.burst) > 40) {
													settings.dots.limit = Math.max(settings.dots.min, settings.dots.limit - 2);
												} else {
													settings.dots.limit = Math.min(settings.dots.max, settings.dots.limit + 2);
												}
												// $('.control-pastday').text(elapsed - (settings.speed.drop + settings.speed.burst) + ' ' + settings.dots.limit);
												// reset limitcalc
												limitcalc.elapsed = 0;
												limitcalc.count = 0;
											}
											$this.remove();
											dots--;
										});
									});
									dots++;
								} else {
									setTimeout( function() {
										dotCanvas(plot);
									}, settings.speed.drop);
								}
							}
						}, Math.round((settings.refresh / settings.dots.total) * i ));
					});
					console.log('total plots processed: ' + settings.dots.total);
				});
				setTimeout( function() { process(); }, settings.refresh );
			}

			process();
			setInterval( function() {
				console.log( 'dots animating now:  ' + dots );
				console.log( 'current limit:       ' + settings.dots.limit );
				console.log( 'percentage of total: ' + Math.round( (settings.dots.limit * ( settings.refresh / (settings.speed.drop + settings.speed.burst) ) / settings.dots.total) * 100) + '%' );
			}, settings.refresh / 4 );

			$('.map-caption').on('click', '.key-more-info', function(e) {
				e.preventDefault();
				var $this = $(this);
				$this.closest('.map-caption').toggleClass('more-info');
				var activetext = 'Less Info';
				if ($this.text() == activetext) {
					$this.text('More Info');
					// $('.key-secondary').fadeOut();
				} else {
					$this.text(activetext);
					// $('.key-secondary').fadeIn();
				}
			});

			// try to detect iphone 4 and under
			// var wh = window.screen.height;
			// var ww = window.screen.width;
			// var wr = wh / ww;
			// var ios = navigator.userAgent.match(/(iPad|iPhone|iPod)/g);
			// if ( (ww==480 || ww==320) && ( wh==480 || ww==320 ) && ( wr==1.5 || wr==(2/3) ) && ios ) {
			if ($.browser.mobile) {
				$('body').addClass('iphone4');
				$('.control-pastday').click();
				// map.settings.iphone4 = true;
				// map.settings.dots.limit = 10;
			}

		})(); // end map
	}


	// TODO: scope out some of this netgauge stuff so it doesn't try to execute on every page

	var $doc = $(document);
	var $gauge = $('.gauge');
	var $needle = $('.needle');
	var $apr = $('.arc-packet-rotate');
	var $hdots = $('.hosting-dots li');
	var $hcities = $('.hosting-city');
	var $arccontainer = $('.arc-container');
	var $graphcontainer = $('.graph-container');
	var $gr = $('.graph-regular');
	var needletimeout;
	var citytimeout;
	var scrolltimeout;
	var needlemoving = false;
	var graphsmoving = false;
	var packetmoving = false;
	var packetleft = true;
	var $navbar = $('.section-navbar');
	var navheight = $navbar.height();

	// make .match-height > .match-target the same height
	// adapted from: http://stackoverflow.com/questions/12330786/is-there-a-way-to-make-all-elements-in-a-row-class-the-same-height
	// this is called after flexslider finishes loading because stuff is weird beforehand (0 height containers, for example)
	// TODO: make this a jquery plugin
	function matchHeight() {
		$('.match-height').each( function(i, el) {
			var $el = $(el);
			if (!$el.hasClass('matched')) {
				var $targets = $el.find('.match-target');
				$targets.height( Math.max.apply( Math, $targets.map(function() {
					return $(this).outerHeight();
				}).get()) );
			}
			$el.addClass('matched');
		});
	}

	function highlightCity(options) {
		options = options || {};
		var speed = typeof options.speed !== 'undefined' ? options.speed : 5000;
		var blur = typeof options.blur !== 'undefined' ? options.blur : false;
		var hover = typeof options.hover !== 'undefined' ? options.hover : false;
		clearTimeout(citytimeout);
		$hcities.removeClass('hc-active');
		$hdots.removeClass('hd-active');
		if (!blur) {
			var $city = typeof options.city !== 'undefined' ? $(options.city) : $hcities.eq(Math.floor(Math.random() * $hcities.length));
			$city.addClass('hc-active');
			var $target = $($city.data('target'));
			$target.addClass('hd-active');
			$target.find('div').css({opacity: 1, scale: 1}).transition({ duration: 1000, opacity: 0, scale: 3 });
		}
		if (!hover) {
			citytimeout = setTimeout( function() {
				highlightCity({speed: speed});
			}, speed);
		}
	}

	function moveNeedle(options) {
		if (!needlemoving) {
			needlemoving = true;
			options = options || {};
			clearTimeout(needletimeout);
			var deg = typeof options.deg !== 'undefined' ? options.deg : Math.floor(Math.random() * 240 - 120);
			var repeat = typeof options.repeat !== 'undefined' ? options.repeat : false;
			var repeatdelay = typeof options.repeatdelay !== 'undefined' ? options.repeatdelay : 500;
			var speed = typeof options.speed !== 'undefined' ? options.speed : 500;
			var easing = typeof options.easing !== 'undefined' ? options.easing : 'in-out';
			$needle.transition({ duration: speed, rotate: deg + 'deg', easing: easing }, function() {
				if (repeat) {
					needletimeout = setTimeout( moveNeedle, repeatdelay );
				}
				needlemoving = false;
			});
		}
	}

	// should we shrink the navbar?
	var shrinknavbar = !$('.switch-navbar-no-shrink').length;
	// get the element that keys the shrink
	var $shrinkkey = $('.shrink-key').eq(0);
	var $subnavkey = $('.subnav-key').eq(0);
	var subnavexists = !!$subnavkey.length;
	// if .shrink-key doesn't exist, set shrink key to second section (the one after the nav)
	if (!$shrinkkey.length) {
		$shrinkkey = $('.section').eq(1);
	}
	// default to never shrink, just in case something is busted
	var shrinkkeytop = ($shrinkkey.length) ? $shrinkkey.offset().top : 10000000;
	var subnavkeytop = (subnavexists) ? $subnavkey.offset().top : shrinkkeytop;
	var mininavcreated = false;
	var $mininav;
	// create mininav bar
	if (subnavexists) {
		$mininav = $('<div class="section-mini-nav"></div>');
		$mininav.html($('.netgauge-subnav').html());
		mininavcreated = true;
		$mininav.insertAfter($navbar);
	}

	function fixHeader() {
		if (shrinknavbar) {
			$loginMessage = $(".login-message");
			if ($doc.scrollTop() > shrinkkeytop - navheight) {
				$loginMessage.hide();
				$navbar.addClass('navbar-small');
			} else {
				$navbar.removeClass('navbar-small');
				$loginMessage.show();
			}
		}
	}

	function fixSubNav() {
		if (subnavexists) {
			if ($doc.scrollTop() > subnavkeytop - navheight) {
				$mininav.addClass('section-mini-nav-show');
				$('.nav-shadow').addClass('hidden');
				$navbar.addClass('navbar-subnav-show');
			} else {
				$mininav.removeClass('section-mini-nav-show');
				$('.nav-shadow').removeClass('hidden');
				$navbar.removeClass('navbar-subnav-show');
			}
		}
	}

	function moveGraphs(options) {
		if ($graphcontainer.length) {
			if ( !graphsmoving ) {
				graphsmoving = true;
				so = $gr.eq(0).parents('li').offset().left;
				var grx = -1 * $gr.offset().left + so - 100;
				$gr.transition( ($.support.transition) ? { x: grx, easing: 'in-out' } : { right: -1 * grx, easing: 'easeInOutQuart' }, 5000, function() {
					graphsmoving = false;
				} );
			}
		}
	}

	function movePacket(options) {
		if ( $arccontainer.length) {
			if (!packetmoving) {
				options = options || {};
				var pos = typeof options.pos !== 'undefined' ? options.pos : 'toggle';
				var speed = typeof options.speed !== 'undefined' ? options.speed : 1000;
				if (pos == 'toggle') {
					if (packetleft) {
						pos = 'right';
					} else {
						pos = 'left';
					}
				}
				if ( (packetleft && pos == 'right') || (!packetleft && pos == 'left') ) {
					packetmoving = true;
					var deg = {};
					deg.left = -19.5;
					deg.right = 19.5;
					packetleft = (pos == 'left');
					$apr.css('opacity', 1);
					$apr.transition({ rotate: deg[pos] + 'deg', duration: speed, easing: 'in-out' }, function() {
						var $this = $(this);
						$this.css('opacity', 0);
						if (packetleft) {
							$this.siblings('.arc-client').find('.arc-burst').fadeIn(100, function() {
								$(this).fadeOut(500);
							});
						} else {
							$this.siblings('.arc-server').find('.arc-burst').fadeIn(100, function() {
								$(this).fadeOut(500);
							});
						}
						setTimeout(function() { packetmoving = false; }, 2000);
					});
				}
			}
		}
	}

	function movePacketSearch(options) {
		if ($('.arc-search-container').length ) {
			if (!packetmoving) {
				options = options || {};
				var pos = typeof options.pos !== 'undefined' ? options.pos : 'toggle';
				var speed = typeof options.speed !== 'undefined' ? options.speed : 1000;
				if (pos == 'toggle') {
					if (packetleft) {
						pos = 'right';
					} else {
						pos = 'left';
					}
				}
				if ( (packetleft && pos == 'right') || (!packetleft && pos == 'left') ) {
					packetmoving = true;
					var deg = {};
					deg.left = -19.5;
					deg.right = 19.5;
					packetleft = (pos == 'left');
					$apr.css('opacity', 1);
					$apr.transition({ rotate: deg[pos] + 'deg', duration: speed, easing: 'in-out' }, function() {
						var $this = $(this);
						$this.css('opacity', 0);
						if (packetleft) {
							$this.siblings('.arc-client').find('.arc-burst').fadeIn(100, function() {
								$(this).fadeOut(500);
							});
						} else {
							$this.siblings('.arc-server').find('.arc-burst').fadeIn(100, function() {
								$(this).fadeOut(500);
							});
						}
						setTimeout(function() { packetmoving = false; }, 2000);
					});
				}
			}
		}
	}


	$gauge.on('click touchstart', function() {
		moveNeedle();
	});

	$arccontainer.on('click touchstart', function() {
		movePacket();
	});

	 $('.kb-form-search').on('submit', function(e) {
		  movePacketSearch();
		});

	$hcities.on('mouseenter touchstart click', function() {
		highlightCity({ hover: true, city: this });
	});

	$hcities.on('mouseleave', function() {
		highlightCity({ blur: true });
	});

	$('.hosting-header').on('click touchstart', function() {
		highlightCity();
	});

	$('#ooklahosting').on('change', function(){
		if($(this).is(':checked')){
			$('.hosting-options').show('slow');
		}
		else{
			$('.hosting-options').hide('slow');
		}
	});

	$('#choose-modern').on('click', function(){
		$('input:radio[name=template_choice]')[0].checked = true;
	});

	$('#choose-classic').on('click', function(){
		$('input:radio[name=template_choice]')[1].checked = true;
	});

	// prefill website based on email address
	// no need to include payment email fields (#ccemail, #ppemail, #poemail) because there is no website field in those forms
	$('#email').on('change', function() {
		var $this = $(this);
		var $website = $('#website');
		if ($website) {
			if ( !$website.val() && $this.valid() ) {
				var domain = $this.val().replace(/.*@/, "");
				// scrub list, which is probably excessive
				var scrublist = ['gmail.com','yahoo.com','hotmail.com','gmx.de','googlemail.com','mail.ru','web.de','live.com','aol.com','gmx.net','yandex.ru','me.com','msn.com','comcast.net','hushmail.com','yahoo.de','hotmail.co.uk','lavabit.com','sbcglobal.net','safe-mail.net','ymail.com','yahoo.co.uk','mac.com','qq.com','gmx.com','hotmail.de','ya.ru','rambler.ru','o2.pl','abv.bg','freenet.de','mailinator.com','gmx.at','cox.net','rocketmail.com','bk.ru','ukr.net','163.COM','arcor.de','mail.com','list.ru','att.net','aim.com','live.co.uk','inbox.ru','verizon.net','126.com','hush.com','t-online.de','free.fr','shaw.ca','wp.pl','hotmail.fr','yahoo.com.au','live.de','yahoo.ca','btinternet.com','iki.fi','hotmail.it','yahoo.it','mail.bg','live.com.au','fastmail.fm','yahoo.fr','seznam.cz','gmx.ch','bellsouth.net','online.de','live.se','zoho.com','tiscali.it','pobox.com','nym.hush.com','i2pmail.org','earthlink.net','tut.by','libero.it','juno.com','hush.ai','snkmail.com','charter.net','sina.com','riseup.net','centrum.cz','yahoo.es','yahoo.com.vn','yahoo.com.cn','mit.edu','live.dk','live.ca','inbox.lv','i.ua','telus.net','telia.com','telenet.be','optonline.net','klzlk.com','yahoo.se','yahoo.com.ar','sharedaddy.com','rochester.rr.com','prime.gushi.org','yahoo.com.br','tlen.pl','sporktronics.com','spamgourmet.com','live.nl','live.fr','inbox.com','hmamail.com','email.com','bluewin.ch'];
				if ( $.inArray(domain, scrublist) == -1 ) {
					$website.val( 'http://' + domain + '/' );
				}
			}
		}
	});

	// prefil city/state based on zip
	$('#zip, #cczip, #ppzip, #pozip').on('change', function() {
		var $this = $(this);
		// get the prefix like cc, pp, po (or an empty string for fields with IDs of "zip")
		var prefix = $this.attr('id').split('zip')[0];
		var city = $('#' + prefix + 'city');
		var state = $('#' + prefix + 'state');
		if (!city.val() && $this.valid()) {
			$.getJSON('//api.geonames.org/postalCodeLookupJSON?country='+$.cookie("country_code")+'&username=ookla&callback=?', {postalcode: this.value }, function(response) {
				if (!city.val() && response && response.postalcodes.length && response.postalcodes[0].placeName) {
					city.val(response.postalcodes[0].placeName);
					state.val(response.postalcodes[0].adminCode1);
				}
			});
		}
	});

	// enable sisyphus to persist form data in the event of the user leaving the page
	$('form').not('.exclude').sisyphus({
		timeout: 5,
		excludeFields: $('input[id*=captcha], input[name*=captcha], input[type=hidden], input#password, input#loginemail, input#search')
	});

	highlightCity();

	var currentscroll = $doc.scrollTop();
	$doc.on('scroll', function() {
		if ($('.modal-backdrop').length) {
			scrollTo(0, currentscroll);
		} else {
			clearTimeout(scrolltimeout);
			scrolltimeout = setTimeout(function() {
				moveGraphs();
				movePacket();
				// moveNeedle();
				fixHeader();
				fixSubNav();
			}, 100 );
			currentscroll = $doc.scrollTop();
		}
	});

	// set up flexslider components
	$('.flexslider').flexslider({ animation: 'slide', pauseOnHover: true, slideshow: false, start: function($fs) {
		// center the nav dots (TODO: re-center on resize)
		var $fcn = $fs.find('.flex-control-nav');
		$fcn.css({ 'left': ($fs.width() / 2 - $fcn.width() / 2) });
		// this is called after flexsliders have finished loading
		matchHeight();
	} });

	if (!$('.flexslider').length) {
		matchHeight();
	}

	// bootstrap tooltips are opt-in
	$('a[data-toggle="tooltip"]').tooltip();

	if ( $gauge.length ) {
		needletimeout = setTimeout( function() {
			moveNeedle({ deg: 120, repeat: false, speed: 2000 });
		}, 1000);
	}

	function addCommas(nStr) {
		nStr += '';
		x = nStr.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		return x1 + x2;
	}

	// set up  test counter
	var testcounter = $('.test-counter');
	if ( testcounter.length > 0 ) {
		setInterval (function(){
			testcounter.text( addCommas(Math.round( tick.current += tick.increment )));
		}, tick.rate || 20 );
	}

	// Inquiry Form Code
	if($('#ni-businesscategory').val() == 'isp'){
		 $('.subscriber-base').slideDown();
	};

	$('#ni-businesscategory').on('change', function(e) {
		if($('#ni-businesscategory').val() == 'isp'){
			 $('.subscriber-base').slideDown();
		}else{
			$('.subscriber-base').slideUp();
		}
	})



	// support form code
	$('.showSupport').on('click', function(e) {
		e.preventDefault();
		$('.validate-form').validate();
	});

	$('.showLogin').on('click', function(e) {
		e.preventDefault();
		$('#supportForm').slideUp();
		$('#loginForm').slideDown();
		$('.validate-form').validate();
	});

	// any errors on the support-form page are for the support form, so show that form
	// login errors show up on the user-login page
	if ($('#supportForm').length) {
		if ($('.form-errors').length) {
			$('.showSupport').eq(0).click();
		}
	}

	$('#clientrelated').on('change', function(e) {
		if ( $(this).is(':checked') ) {
			$('#clientConfig').slideDown();
		} else {
			$('#clientConfig').slideUp();
		}
	});

	// fill in hidden date fields if the form has those fields
	$('form').on('submit', function(e) {
		var $ldth = $('#local_datetime_hour');
		var $ldt = $('#local_datetime');
		var $ldto = $('#local_datetime_order');
		var $ldtr = $('#local_datetime_renewal');
		var $ldow = $('#local_day_of_week');
		var d = new Date();
		if ($ldth.length > 0) {
			$ldth.val(d.getHours());
		}
		if ($ldt.length > 0) {
			$ldt.val(d.toString());
		}
		if ($ldto.length > 0) {
			$ldto.val(d.toString());
		}
		if ($ldow.length > 0) {
			$ldow.val(d.getDay());
		}
		if ($ldtr.length > 0) {
			$ldtr.val(d.toString());
		}
	});

	// Form validation
	$('.validate-form').each(function() {
		$(this).validate();
	});


	// Code for Payment Page

	var payarray = [];
	payarray.push({ id: 'DEFAULT'       , hash: ''     });
	payarray.push({ id: 'ACH'           , hash: 'ach'  });
	payarray.push({ id: 'CHECK'         , hash: 'check'});
	payarray.push({ id: 'CREDIT-CARD'   , hash: 'cc'   });
	payarray.push({ id: 'PAYPAL'        , hash: 'pp'   });
	payarray.push({ id: 'PURCHASE-ORDER', hash: 'po'   });
	payarray.push({ id: 'WIRE-TRANSFER' , hash: 'wt'   });

	// cache the #payment-choice select box
	$paymentchoice = $('#payment-choice');
	$paymentform = $('#payment-form');

	// set the hash based on the payment select
	$paymentchoice.change( function() {
		var selectedValue = $(this).find(':selected').val();
		$('.payment-type').hide();
		$('#' + selectedValue).fadeIn();
		var newhash = $.map(payarray, function(o, i) { if (o.id == selectedValue ) return o.hash; })[0];
		location.hash = newhash;
		var action = $paymentform.attr('action');
		$paymentform.attr('action', action.split('#')[0] + '#' + newhash);
	});

	// open payment form based on hash
	if ($paymentchoice.length) {
		if (location.hash.length > 1) {
			$paymentchoice.val( $.map(payarray, function(o, i) { if (o.hash == location.hash.replace('#', '') ) return o.id; })[0] );
			$paymentchoice.change();
		}
	}

	$categorychoice = $('#category');
	$productchoice = $('#producttype');
	$applicationtype = $( 'input[name="applicationlocation"]:radio');
	$errorlinks = $('#errors-links');
	$reportinglinks = $('#reporting-links');
	$setuplinks = $('#setup-links');
	$sthostlinks = $('#sthosts-links');
	$netmetriclinks = $('#netmetrics-links');
	$billinglinks = $('#billing-links');
	$customizationlinks = $('#customization-links');
	$support_form_links =	$('.form-select-buttons a');
	$host_problem = $('#host_problem');
	$error_message = $('#error_message');
	$category_choice = $('.category-choice')

	$error_form_fields = $('.error-form .support-fields');
	$setup_form_fields = $('.setup-form .support-fields');
	$billing_form_fields = $('.billing-form .support-fields');
	$netmetrics_form_fields = $('.netmetrics-form .support-fields');
	$hosts_form_fields = $('.hosts-form .support-fields');
	$customization_form_fields = $('.feature-form .support-fields');

	$subject_choice = $('.subject-choice');
	$category_select = $('#category');


		$categorychoice.change( function(){
			updateSupport($categorychoice.val());
		})

		$productchoice.change( function(){
			showjavaField($productchoice.val());
		})



  //updateSupport($categorychoice.val());
  appType($('input[name=applicationlocation]:checked').val());


  function appType(choice){
	 if(choice == 'Public' || choice == ''){
		$('.private-field').hide();
		$('#installoc').addClass("required");
	 } else{
		$('.private-field').slideDown();
		$('#installoc').removeClass("required");
	}
	showjavaField($('#producttype').val());
  }

  function showjavaField(choice){
	  if(choice == 'speedtest' || choice == 'netgauge'){
			$('#java-choice').hide();
		} else if($categorychoice.val() != 'billing' && $('input[name=applicationlocation]:checked').val() == 'Private'){
		  $('#java-choice').show();
		}
  }

  function loggedIn() {
  	if($('.logged-in').length > 0){
	   return true
    } 
  }

   if(loggedIn()){
	   $('.contact-info').hide();
    } else{
	   $('.contact-info').show();
   }

	function updateSupport(choice){
		$support_form_links.removeClass('active');
		if(choice){
			$('.support-fields').slideDown();
			$('.login-options').slideDown();
		}

		// Process Error Message Choice
		if (choice == 'errors'){
			$errorlinks.fadeIn();
			$("#error-form").show();
			if ($error_form_fields.length == 0){
				$('.error-form').load("/support-type.php?category=errors")
			}
			$('#errors-links h5').html('Quick Help for Errors');
			$('#select-errors').addClass('active');
			setDynamic('errors');
		} else{
			$('.error-form .support-fields').remove();
			$errorlinks.hide();
			$("#error-form").hide();
		}

		// Process Setup Choice
		if (choice == 'setup'){
			$('#setup-form').show();
			if ($setup_form_fields.length == 0){
				$('.setup-form').load("/support-type.php?category=setup");
			}
			$setuplinks.fadeIn();
			$('#select-setup').addClass('active');
			$('#setup-links h5').html('Quick Help for Setup');
			setDynamic('setup');

		} else{
			$('.setup-form .support-fields').remove();
			$setuplinks.hide();
			$('#setup-form').hide();

		}

		// Process Netmetrics Choice
		if (choice == 'netmetrics'){
			$('#netmetrics-form').show();
			if ($netmetrics_form_fields.length == 0){
				$('.netmetrics-form').load("/support-type.php?category=netmetrics")
			}
			$netmetriclinks.fadeIn();
			$('#select-netmetrics').addClass('active');
			$('#netmetrics-links h5').html('Quick Help for Speedtest Intelligence');
				setDynamic('netmetrics');
		} else{
			$('.netmetrics-form .support-fields').remove();
			$netmetriclinks.hide();
			$('#netmetrics-form').hide();
		}

		// Process Speedtest Hosts Choice
		if(choice == "sthosts"){
			$('#hosts-form').show();
			if ($hosts_form_fields.length == 0){
				$('.hosts-form').load("/support-type.php?category=hosts")
			}
			$sthostlinks.fadeIn();
			$('#select-sthosts').addClass('active');
			$('#sthosts-links h5').html('Quick Help for Hosts');
		  setDynamic('hosts');
		}else{
			$('.hosts-form .support-fields').remove();
			$hosts_form_fields.remove();
			$sthostlinks.hide();
			$('#hosts-form').hide();
			 $('.subject-choice').hide();;
		}

		// Process billing choice
		if (choice == 'billing'){
			$('#billing-form').show();
			if ($('.billing-form .support-fields').length == 0){
				$('.billing-form').load("/support-type.php?category=billing")
			}
			$billinglinks.fadeIn();
		  $('#select-billing').addClass('active');
			$('#billing-links h5').html('Quick Help for Billing');
		} else{
			$('.billing-form .support-fields').remove();
			$billinglinks.hide();
			$('#billing-form').hide();
		}

		// Process Feature Requests Choice
		if (choice == 'customization'){
			$('#feature_requests_form').show();
			if ($customization_form_fields.length == 0){
				$('.feature-form').load("/support-type.php?category=customization")
			}
			$customizationlinks.fadeIn();
			$('#select-customization').addClass('active');
			$('#customization-links h5').html('Quick Help for Request');
		} else{
			$('.feature-form .support-fields').remove();
			$customizationlinks.hide();
			$('#feature_requests_form').hide();
		}


		$choice = $category_select.val();
		$category_choice.val($choice);

	}





	$(function() {

	$("#parsexml").submit(function(){
	var data = $('#parsexml').serialize();
	$.ajax({
	    url: "/parse-xml.php",
	    type: "POST",
	    data: data,
	    beforeSend: function(){
		    $('.icon-ok').addClass('hide');
		    $('.icon-globe').hide();
		    $('#invalid-url').hide();
		    $('#display').hide();
		    $('#spinner').show();
	    },
	    error: function(msg){
		    $('#spinner').hide();
		    $('.icon-globe').show();
		    $('#invalid-url').show();
			},
	    success: function(results) {
	      $('#display').html(results).slideDown();
	      $('#spinner').hide();
	      $('.icon-ok').removeClass('hide');
	      $('#invalid-url').hide();
	      }
	    });
	    return false;
	});
	});


	function setDynamic(type){
		$formType = $('#supportForm_'+type);

		if($("#installoc").val() !="" && $("#installdetails").val() == ""){
			getConfiguration();
		}
		$formType.on("change", "#installoc",function(){
	  	getConfiguration();
		});

		$formType.on("click", "input[name=applicationlocation]",function(){
			appType($('input[name=applicationlocation]:checked').val());
		})

		$formType.on("change", "#producttype",function(){
		  showjavaField($('#producttype').val());
		});

		$formType.on("change", "#clientrelated",function(){
			  if ( $(this).is(':checked') ) {
					$('#clientConfig').slideDown();
				} else {
					$('#clientConfig').slideUp();
				}
		});

		$formType.on("change", "#error_message", function(){
				$('#description').val($('#error_message').val());
	  })

	  $formType.on("change", "#host_problem", function(){
		  console.log($("#host_problem").val());
		  if($("#host_problem").val() == 'other'){
			  $('#subject').val("");
		  	$('.subject-choice').show();
		  } else{
				$('.subject-choice').hide();
				$('#subject').val("Host Support Request");
		  }
	  })

	}


	function getConfiguration(){
		var data = $('#supportForm_'+$category_select.val()).serialize();
		var invalid =  $('#invalid-url');
		var valid = $('#valid-url');
		$.ajax({
		    url: "/app-url.php",
		    type: "POST",
		    data: data,
		    beforeSend: function(){
			    $('#installdetails').val('');
			    $('.icon-globe').hide();
			    invalid.hide();
			    valid.hide();
			    $('#display').hide();
			    $('#spinner').show();
		    },
		    error: function(msg){
			    $('#installdetails').val('');
			    $('#spinner').hide();
			    $('.icon-globe').show();
			    invalid.show();
			    valid.hide();
			    $('#private-app').prop("checked", "checked");
			    $('#public-app').removeAttr("checked");
			    appType($('input[name=applicationlocation]:checked').val());
				},
		    success: function(results) {
			    valid.slideDown();
			    $('#installdetails').val(results);
		      $('#spinner').hide();
		      invalid.hide();
		      $('.icon-globe').show();
					$('#public-choice').prop("checked", true);
			    $('#private-app').removeAttr("checked");
			    appType($('input[name=applicationlocation]:checked').val());
		      }
		    });
		    return false;

	}

	$('.get-xml').on('click', function(){
		loadXML();
		return false;
	})

	function xmlToString(xmlData) { // this functions waits jQuery XML
	    var xmlString = undefined;

	    if (window.ActiveXObject){
	        xmlString = xmlData[0].xml;
	    }

	    if (xmlString === undefined)
	    {
	        var oSerializer = new XMLSerializer();
	        xmlString = oSerializer.serializeToString(xmlData[0]);
	    }

	    return xmlString;
	}

	function loadXML(){
		var data = $('#installoc').val();
		var invalid =  $('#invalid-url');
		var valid = $('#valid-url');
		$.ajax({
		    url: "/app-url.php?purexml="+data,
		    type: "POST",
		    data: data,
		    dataType: "xml",
		    beforeSend: function(){
			    $('#installdetails').val('');
			    $('.icon-globe').hide();
			    invalid.hide();
			    valid.hide();
			    $('#display').hide();
			    $('#spinner').show();
		    },
		    error: function(msg){
			    $('#xmldata').val('');
			    $('#spinner').hide();
			    $('.icon-globe').show();
			    invalid.show();
			    valid.hide();
			    appType($('input[name=applicationlocation]:checked').val());
				},
		    success: function(results) {
			    valid.slideDown();
			    $('#collapseOne').addClass("in");
					var $xml = $(results);
					var $translation = $xml.find("translation");
          $language = $($translation).attr('lang')
					$translation.each(function(){
						if($(this).attr('lang') == $language){
							console.log($(this).attr('lang'));
					   $(this).find("text").each(function(){
						   var id = $(this).attr('id');
						   $("#"+id).val($(this).text());
						   $("#"+id).toggleClass('empty', !Boolean($("#"+id).val()));
					    });
					}
					});

					// Remove any existing translation definitions
					$translation.each(function(){
						$(this).remove()
					})

				  // Save configuration file in field for later use
					$('#xmldata').val(xmlToString($xml));

		      $('#spinner').hide();
		      invalid.hide();
		      $('.icon-globe').show();
					$('#public-choice').prop("checked", true);
			    $('#private-app').removeAttr("checked");
			    appType($('input[name=applicationlocation]:checked').val());
		      }
		    });
		    return false;

	}

	$('#download-xml-file').on('click', function(){
		$('#xml-data').submit()
	})


	// do some stuff to prep pages after they have loaded
	$(document).ready( function() {

		// check to see if a modal should be opened on page load
		if (location.hash.length > 1) {
			var $modal = $(location.hash);
			if ($modal.hasClass("modal") && $modal.selector != "#termsModal") {
				$modal.modal("show");
			}
		}		

		// show the client config area on the support form if the box is checked
		$('#clientrelated').trigger('change');
		// if there are any errors inside a modal, show that modal
		$('.modal .form-errors').closest('.modal').modal('show');

		// netgauge customization code
		if ( $('.form-ngc') ) {

			$('#ngc-save').on('click', function(e) {
				e.preventDefault();
				postData = $(".form-ngc").serialize();
				$.ajax({
					type: "post",
					url: "/netgauge/customize",
					data: postData,
					contentType: "application/x-www-form-urlencoded",
					success: function(response) {
						// remove previous share url
						$('.share-url').remove();
						// append share url
						$('.config-link').append("<a class='share-url' href='"+response.share_url+"'>"+response.share_url+"</a>")
						// Handle form transistion
						var $ngccontrols = $('.ngc-controls');
						$ngccontrols.fadeOut('fast', function() {
							$ngccontrols.parent().addClass('span2').removeClass('span4');
							$('.ngc-show-on-edit').fadeOut('fast', function() {
								$('div.ngc-hide-on-edit').fadeIn('fast');
							});
							// different animation for the paragraph
							$('p.ngc-hide-on-edit').slideDown('fast');
						});
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);
					}
				});
			});

			ngc.display = {};
			ngc.controls = {
				$template:   $('#ngc-style'),
				$uicolor:    $('#ngc-ui-color'),
				$bgcolor:    $('#ngc-background-color'),
				$framecolor: $('#ngc-frame-color'),
				$clienticon: $('#ngc-icon-client'),
				$servericon: $('#ngc-icon-server'),
				$thumbnail:  $('#ngc-thumbnail'),
				$logo:       $('#ngc-logo'),
				$modernonly: $('.ngc-modern-only')
			}
			ngc.init       = false;
			ngc.template   = ngc.controls.$template.val();
			ngc.uicolor    = ngc.controls.$uicolor.val();
			ngc.bgcolor    = ngc.controls.$bgcolor.val();
			ngc.framecolor = ngc.controls.$framecolor.val();
			ngc.clienticon = ngc.controls.$clienticon.val();
			ngc.servericon = ngc.controls.$servericon.val();
			ngc.thumbnail  = ngc.controls.$thumbnail.val();
			ngc.display.$uicolor    = ngc.controls.$uicolor.parents('.controls').find('.color-display');
			ngc.display.$bgcolor    = ngc.controls.$bgcolor.parents('.controls').find('.color-display');
			ngc.display.$framecolor = ngc.controls.$framecolor.parents('.controls').find('.color-display');
			ngc.controls.$template.trigger('change');
			ngc.controls.$logo.ajaxfileupload({
				'action': '/upload-logo.php',
				'valid_extensions': ['gif', 'jpeg', 'jpg', 'ai', 'eps', 'png', 'bmp', 'svg', 'tiff', 'tif', 'ps'],
				'onStart': function() {
					$('.logo-upload-indicator').show();
				},
				'onComplete': function(response) {
					$('.logo-upload-indicator').hide();
					if (response.status) {
						ngc.thumbnail = response.thumbnail_img;
						$('#customization_file_id').val(response.id);
						updateLogo(ngc.thumbnail);
					}
				},
			});
			createSpectrum({ el: '#ngc-ui-color', color: ngc.uicolor });
			createSpectrum({ el: '#ngc-background-color', color: ngc.bgcolor });
			createSpectrum({ el: '#ngc-frame-color', color: ngc.framecolor });
		}

	});


	// netgauge customization code

	$('.ngc-control').on('change', function (e) {
		if ($customng) {
			var $this = $(this);
			// hide any visible color panels
			if ( !$this.hasClass('ngc-control-color') ) {
				$('.ngc-control-color').spectrum('hide');
			}
			// if modifying the template select
			if ( $this.attr('id') == 'ngc-style') {
				// if the template changes
				if ( $this.val() != ngc.template || !ngc.init ) {
					ngc.init = true;
					ngc.template = $this.val();
					// replace #speedtest with a new one (maybe empty would be better?)
					$customng.replaceWith('<div id="speedtest"></div>');
					// update button group
					ngcUpdateButtons( $this, ngc.template );
					// show/hide $modernonly controls
					if ( ngc.template == 'classic' ) {
						ngc.controls.$modernonly.slideUp('fast');
					} else {
						ngc.controls.$modernonly.slideDown('fast');
					}
					// do swfobject with new template
					embedCustomNG( ngc.template );
				}
			} else {
				// handle changes in non-template controls (colors, icons, logos, etc)
				setupCustomNG();
			}
		}
	});

	// update select boxes when buttons are clicked
	$('.group-ngc').on('click', 'button', function(e) {
		var $this = $(this);
		var value = $this.data('ngc-value');
		var $select = $( '#' + $this.parents('.btn-group').data('bind-select') );
		$select.val(value);
		$select.trigger('change');
	});

	function setupCustomNG() {
		// update ngc.uicolor with new val
		if ( ngc.controls.$uicolor.val().length > 0 ) {
			ngc.uicolor = ngc.controls.$uicolor.val().replace('#', '');
		}
		// if we are on the classic template, that's the only color we need
		if ( ngc.template == 'classic' ) {
			// update the swf with the color
			$customng.get(0).sendColorFromJS( '0x' + ngc.uicolor );
			// hide modern colors just in case
			ngc.controls.$modernonly.slideUp('fast');
		// else we are on the modern template
		} else {
			// update ngc.bgcolor
			if ( ngc.controls.$bgcolor.val().length > 0 ) {
				ngc.bgcolor = ngc.controls.$bgcolor.val().replace('#', '');
			}
			// update ngc.framecolor
			if ( ngc.controls.$framecolor.val().length > 0 ) {
				ngc.framecolor = ngc.controls.$framecolor.val().replace('#', '');
			}
			// update the swf with these colors
			$customng.get(0).sendColorFromJS( '0x' + ngc.bgcolor, '0x' + ngc.uicolor, '0x' + ngc.framecolor );
			// show the modern colors just in case
			ngc.controls.$modernonly.slideDown('fast');
		}
		// update icons
		ngc.clienticon = ngc.controls.$clienticon.val();
		ngc.servericon = ngc.controls.$servericon.val();
		// update button groups
		ngcUpdateButtons( ngc.controls.$clienticon, ngc.clienticon );
		ngcUpdateButtons( ngc.controls.$servericon, ngc.servericon );
		// update the icons in the swf
		$customng.get(0).sendIconsFromJS( ngc.clienticon, ngc.servericon );
		// update the logo (this doesn't re-upload, so whatever)
		if (ngc.thumbnail.length > 0) {
			updateLogo(ngc.thumbnail);
		}
		// update the little color display text below the colors
		ngc.display.$uicolor.text( '#' + ngc.uicolor );
		ngc.display.$bgcolor.text( '#' + ngc.bgcolor );
		ngc.display.$framecolor.text( '#' + ngc.framecolor );
	}

	function ngcUpdateButtons($select, target) {
		// get group name from $select
		var group = $select.data('bind-buttons');
		// build classname for the button that's supposed to be active
		var classname = '.' + group.replace('group-', '') + '-' + target;
		// update the buttons to match the select value
		$(classname).button('toggle');
	}

	function updateLogo(thumb) {
		if (thumb.length) {
			$customng.get(0).sendLogoFromJS(thumb);
		}
	}

	var embedCallback = function(e) {
		if( !e.success || !e.ref ){ return false; }
		var loadInterval = setInterval(function () {
			if(e.ref.PercentLoaded() === 100){
				clearInterval(loadInterval);
				$customng = $('#brandingdemo');
				setTimeout(setupCustomNG, 100);
			}
		}, 200);
	};

	function createSpectrum(arg) {
		$(arg.el).spectrum( {
			color: arg.color,
			showInitial: true,
			clickoutFiresChange: true,
			showInput: true,
			chooseText: 'Set Color',
			move: function(color) {
				clearTimeout(spectrumMoveTimeout);
				spectrumMoveTimeout = setTimeout(function() {
					$(arg.el).spectrum( 'set', color.toHexString() );
					setupCustomNG();
				}, 100);
			}
		});
	}

	function embedCustomNG(template) {
		swfobject.embedSWF('/flash/custom-ng/custom-ng-' + template + '.swf?v=' + Math.floor(Math.random() * 100000), 'speedtest', '620', '420', '10.0.0', false, {}, {}, { id: "brandingdemo" }, embedCallback );
	}

	$('#ngc-edit').on('click', function(e) {
		var $ngccontrols = $('.ngc-controls');
		$ngccontrols.parent().removeClass('span2').addClass('span4');
		// delay showing the controls until the css transition is complete
		setTimeout( function() {
			$ngccontrols.fadeIn('fast');
		}, 200);
		$('div.ngc-hide-on-edit').fadeOut('fast', function() {
			$('.ngc-show-on-edit').fadeIn('fast');
		});
		// different animation for the paragraph
		$('p.ngc-hide-on-edit').slideUp('fast');
		$('#original-logo').hide();
	});

	$('#ngc-order').on('click', function(e) {
		// redirect to order page with hash
	});


	// ngc vars
	var ngc = {};
	var spectrumMoveTimeout;
	var $customng = $('#speedtest');


  // code for support page
    if($category_select.val() != ""){
	    updateSupport($categorychoice.val());
			$support_form_links.removeClass('active');
			$('#select-'+$category_select.val()).addClass('active');

			if($category_select.val() == 'errors'){
				$('#'+$category_select.val()+'-links h5').html('Quick Help for Errors');
			}else if($category_select.val() == 'customization'){
				$('#'+$category_select.val()+'-links h5').html('Quick Help for Requests');
			}else if($category_select.val() == 'sthosts'){
					$('#'+$category_select.val()+'-links h5').html('Quick Help for Hosts');
			}else if($category_select.val() == 'netmetrics'){
					$('#'+$category_select.val()+'-links h5').html('Quick Help for Speedtest Intelligence');
			}
			else{
				$('#'+$category_select.val()+'-links h5').html('Quick Help for '+$category_select.val());
			}

    }

    $('#select-billing').on( 'click', 'div', function(e) {
			e.preventDefault();
				// set the selected choice
				$category_select.val('billing');
				updateSupport($categorychoice.val());
		});

		$('#select-setup').on( 'click', 'div', function(e) {
			e.preventDefault();
				// set the selected choice
				$category_select.val('setup');
				updateSupport($categorychoice.val());

		});

		$('#select-errors').on( 'click', 'div', function(e) {
			e.preventDefault();
				// set the selected choice
				$category_select.val('errors');
				updateSupport($categorychoice.val());
		 });

		$('#select-customization').on( 'click', 'div', function(e) {
			e.preventDefault();
				// set the selected choice
				$category_select.val('customization');
				updateSupport($categorychoice.val());
		 });

		$('#select-netmetrics').on( 'click', 'div', function(e) {
			e.preventDefault();
				// set the selected choice
				$category_select.val('netmetrics');
				updateSupport($categorychoice.val());
		});

		$('#select-sthosts').on( 'click', 'div', function(e) {
			e.preventDefault();
				// set the selected choice
				$category_select.val('sthosts');
				updateSupport($categorychoice.val());
			});

		// Allow categories to be pre-selected on load with ID in URL. 
		// (ie: www.ookla.com/support-form#select-sthosts)

		$('#select-sthosts').focus(function(e) {
				// set the selected choice based on URL ID
				$category_select.val('sthosts');
				updateSupport($categorychoice.val());
			});

		$('#select-billing').focus(function(e) {
				// set the selected choice based on URL ID
				$category_select.val('billing');
				updateSupport($categorychoice.val());
			});

		$('#select-setup').focus(function(e) {
				// set the selected choice based on URL ID
				$category_select.val('setup');
				updateSupport($categorychoice.val());
			});

		$('#select-errors').focus(function(e) {
				// set the selected choice based on URL ID
				$category_select.val('errors');
				updateSupport($categorychoice.val());
			});

		$('#select-customization').focus(function(e) {
				// set the selected choice based on URL ID
				$category_select.val('customization');
				updateSupport($categorychoice.val());
			});

		$('#select-netmetrics').focus(function(e) {
				// set the selected choice based on URL ID
				$category_select.val('netmetrics');
				updateSupport($categorychoice.val());
			});

		
		//Click action for existing host button on /host
		$('#existing-form').click(function(e) {
			window.location = '/support-form#select-sthosts';
		});

		function showArticle(){
			$right_pane = $('.right-pane');
			$left_pane = $('.left-pane');
			$collapse_article = $('.left-pane .collapse-article');
			$expand_article = $('.expand-article');
			setToggleArticle();
				$('.kb-articles').hide();
				$collapse_article.css({"display":"block"});
				$expand_article.hide();
				$right_pane.removeClass("span7");
				$(".kb-searchresults").hide();
				$right_pane.css({"width":"100%"});
				$('.left-gray-border').css({"border-left" : "0px"});
				var right_height = $right_pane.height();
				$left_pane.css({"min-width" : "40px", "min-height" :	right_height, "border-radius" : "2px"} );
					$left_pane.animate({width: "10px"}, 200, function(){
							$collapse_article.show();
					});
		}

		function collapseArticle(){
			$right_pane = $('.right-pane');
			$left_pane = $('.left-pane');
			$collapse_article = $('.left-pane .collapse-article');
			$expand_article = $('.expand-article');
			$(".kb-searchresults").show();
			$expand_article.show();
			$right_pane.css({"width":"540px"});
			$right_pane.addClass("span7");
			$('.left-gray-border').css({"border-left" : "0px"});
			$left_pane.css({"min-width" : "auto", "min-height" : "auto", "border-radius" : "none"} );
				$left_pane.animate({width: "380px"}, 200, function(){
				$collapse_article.hide();
				$('.kb-articles').show();
				$('.left-gray-border').css({"border-left" : "1px solid #bdbdbd"});
			});

		}


		function setToggleArticle(){
			$('.expand-article').one("click", function(){
				showArticle();
				return false;
			})

			$('.collapse-article').one("click", function(){
				collapseArticle();
				return false;
			})
		}

		setToggleArticle();
		loadLikes()


		function getFeed( part, id) {
			// set id to the querystring or leave it blank
			id = !!id ? id : '';
			// valid part parameters: 'categories', 'subcategories', 'articles', and 'article'
			// which works out to level 1, 2, 3, and 4
			var level = kb[part].level;
			var qs = kb[part].qs;
			var downchain = true;
			var target = part;
			while ( downchain ) {
				kb[target].loaded = false;
				kb[target].visible = false;
				refreshContent( kb[target].node, '' );
				if ( kb[target].hasOwnProperty('target') ) {
					target = kb[target].target;
				} else {
					downchain = false;
				}
			}

			processNav(level);

			// Only show spinner if it takes more than 7/10ths of a second to get the json.
			var spin_timer = setTimeout(function(){showSpinner(level)}, 700);

			showBreadCrumb();
			$count = 0;
			$.getJSON( kb.feed + qs + id, function(data) {
				if ( data && data.length > 0 ) {
					// level 4 is article, everything else is a list
					var html = '';
					if( level == 3){
						html += '<h5>'+data[0].subcategory_name+' Questions</h5>';
						if(level == 3){
							// Display subscategory description
							kb.article.node.show();
							document.title = "Ookla | "+data[0].category_name+", "+data[0].subcategory_name;
							$title = data[0].category_name+", "+data[0].subcategory_name;
							kb.article.node.load('/subcategory_description.php?id='+data[0].subcat_id);
						}
					}
					if ( level == 4 ) {
						document.title = "Ookla | "+data[0].name;
						$(".ticket-btns").show();
						$title = data[0].name;
						html += '<a href="#" class="expand-article">+ Expand Article</a>';
						html += '<h2>' + data[0].name + '</h2>';
						if(data[0].id == '22074103' && $('.login-message').length == 0){
							html += '<h4> You must <a href="/user-login">login</a> to see this content.';
						} else {
							html += '<div class="kb-article-content">' + data[0].body + '</div>';
						}
						if(data[0].attachments.length > 0){
							html += "<strong>Attachments:</strong>";
							html += "<ul>"
							$.each(data[0].attachments, function(i, attachment) {
						    html += "<li><a href='"+attachment.content_url+"'>"+attachment.file_name+"</a>";
						  });
							html += "</ul>"
						}
						html += '<hr/><div class="article-vote"><span class="vote-text"></span> <a data-id="' + data[0].id + '" id="vote-temp" class="vote-link" href="#" ></a></div>';
						if(loggedIn()){
							html += '<div class="open-ticket"><span>Need more help?</span> <a href="/support-form">Open a Support Ticket</a></div>';
						}
					} else {
						html += '<ul>';
						$.each( data, function( i, item ) {

							if(level == 2){
								document.title = "Ookla | "+item.category_name;
								$title = item.category_name;
							}

							if(item.id == "20084083"){
								html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-ng"></i><h4>NetGauge</h4></a></li>';
							} else if(item.id == "20094988"){
								html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-nm"></i><h4>NetMetrics</h4></a></li>';
							} else if(item.id == "20035356"){
								html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-st"></i><h4>SpeedTest</h4></a></li>';
							}	else if(item.id == "20035483"){
								html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-lq"></i><h4>LineQuality</h4></a></li>';
							}	else if(item.id == "20035478"){
								html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-home"></i><h4>FAQ</h4></a></li>';
							}	else if(item.id == "21853066" || item.id == '21851341' || item.id == '22577086'){
											html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-general"></i><h4>General</h4></a></li>';
							}	else if(item.id == "20628777"){
											html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-billing"></i><h4>Billing</h4></a></li>';
							}	else if(item.id == "21860698" || item.id == "20620761" || item.id == "20628832"){
											html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-configuration"></i><h4>Configuration</h4></a></li>';
							} else if(item.id == "21842923" || item.id == "20620766" || item.id == "20620781"){
											html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-reporting"></i><h4>Reporting</h4></a></li>';
							} else if(item.id == "21855557" || item.id == "20620728" || item.id == "20620776" || item.id == "22577076"){
											html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-installation"></i><h4>Installation</h4></a></li>';
							}	else if(item.id == "21860708" || item.id == "20620771" || item.id == "20620733" || item.id == "22594813"){
											html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-troubleshooting"></i><h4>Troubleshoot</h4></a></li>';
							}	else if(item.id == "21847812"){
											html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-netindex"></i><h4>NetIndex</h4></a></li>';
							} else if(item.id == "20628772"){
								     	html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-reporting"></i><h4>Common</h4></a></li>';
							} else if(item.id == "21346738"){
								      html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '"><i class="support-secure"></i><h4>Secure Info</h4></a></li>';
							} else if(item.id == "22502703"){
									// don't show reporting category for hosts
							}
							else{

							   html += '<li><a data-part="' + kb[part].target + '" data-id="' + item.id + '" href="' + kb.url + item.url + '">' + item.name + '</a></li>';
							}
								$count++;

						});
						html += '</ul>';

					}
					kb[part].loaded = true;
					kb[part].visible = true;
					// rewrite img src urls
						$images = kb.article.node.find('img');
						$.each($images, function(){
							 $original = $(this).attr('src');
							 $(this).attr('src', 'http://ookla.zendesk.com'+$original);
						})
					refreshContent( kb[part].node, html );
					loadLikes();
					showBreadCrumb();

				} else {
					refreshContent( kb[part].node, '<div class="alert alert-error">Something went wrong. Try reloading the page.</div>' );
				}
				// Clear Timer and hide spinner
				clearTimeout(spin_timer);
				 $('.spinner').hide();

				// Set Push state for url
						setPushState($title);
			});


		}

		$('.slidenav-main').on("click", "a", function(){
			if( $('.slidenav-sub ul li').length > 0 && !$(this).hasClass("active")){
			  customSlideNav('', true);
			}
		})

		$(".showLegacy").on("click", function (e) {
			e.preventDefault();
			$(".legacy-product").show("fast");
		})

		function refreshContent( node, content ) {
			node.show( kb.speed, function() {
				 if (node.prop('outerHTML').indexOf('kb-subcategories ul') >= 0 ){
					  node.css({"top":"-140px"});
					}
				node.empty();
				// content can be an html string or a jquery object
				if ( typeof content == 'string' && content !== '' ) {
					content = $(content);
				}
				if (content.length) {
				  if (node.prop('outerHTML').indexOf('kb-subcategories') >= 0 ){
					  customSlideNav(content);
				  } else{
					  node.append( content ).fadeIn( kb.speed );
				  }
				}
				setToggleArticle();
			});
		}

		$(".category-select").on("click", function () {
			$this = $(this);
			$("#category_id").val($this.attr("data-id"));
			if ($this.attr("data-id") != "all") {
				$cats = $(".kb-categories");
				if ($this.attr("data-id") == "20035356" || $this.attr("data-id") == "20035483") {
					$(".legacy-product").show("fast");
				}
				$el = $cats.find("[data-id='" + $this.attr("data-id") + "']")
				setActive($el);
				getFeed('subcategories', $this.attr("data-id"));
			}
			$(".category-name").html($this.text()+"&nbsp;");
		})

		function loadLikes(){
			  $vote_text = $('.vote-text');
		    $vote_link = $('.vote-link');
		    $temp_link = $('#vote-temp');

				$('.article-vote').on( 'click', 'a.vote-link', function(e) {
					$id = $(this).data('id');
					$.ajax({
					    url: "/api/zendesk_feeds.php?vote=true&id="+$id,
					    type: "POST",
					    dataType: 'json',
					    error: function(msg){
						    $msg = $.parseJSON(msg['responseText']);

						    if($msg.message == "login required"){
							     $vote_text.text("You must first ");
								   $vote_text.append('<a href="/user-login.php">Login</a>.');
								} else{
									$temp_link.removeClass('vote-link');
							    $vote_text.text("There was a problem processing your request. Please try again.");
							    $vote_link.hide();
								};
							},
					    success: function(results) {
						    $temp_link.removeClass('vote-link');
						    $vote_text.text("You marked this article as helpful!");
						    $vote_link.hide();
					      }
					    });
					    return false;
				 });

				// Check if user voted on article
					$article_vote_id = $vote_link.data('id');
					$.ajax({
					    url: "/api/zendesk_feeds.php?vote=check&id="+$article_vote_id+"&user_id=''",
					    type: "GET",
					    success: function(result) {
						  $result = $.parseJSON(result);

						// Handle situation where current user hasn't cast a vote on the article
						   if($result.user_status == 'novote' && $result.total_votes == 0){
							   $vote_text.text("Mark this article as helpful. ");
							   $vote_text.append('<a href="#" class="vote-link" data-id="'+$article_vote_id+'">Click Here</a>');
						   } else if($result.user_status == 'novote' && $result.total_votes == 1){
							   $vote_text.text($result.total_votes +" person found this article helpful. ");
							   $vote_text.append('<a href="#" class="vote-link" data-id="'+$article_vote_id+'">Did you?</a>');
							 } else if($result.user_status == 'novote' && $result.total_votes > 0){
							   $vote_text.text($result.total_votes +" people found this article helpful. ");
							   $vote_text.append('<a href="#" class="vote-link" data-id="'+$article_vote_id+'">Did you?</a>');
							 }
						// Handle instances where the user has voted.
						if($result.user_status == 'voted' && $result.total_votes == 1){
						   $vote_text.text("You were the first to mark this article as helpful!");
					   } else if($result.user_status == 'voted' && $result.total_votes == 2){
						   $vote_text.text("You and "+ ($result.total_votes-1) +" other person found this article helpful. ");

						 } else if($result.user_status == 'novote' && $result.total_votes > 2){
						     $vote_text.text("You and "+ ($result.total_votes-1) +" other people found this article helpful. ");
						 }
						  }
					 });


		}



		function customSlideNav(content, collapse){
			var subnavigation = $('.slidenav-sub');
			if(!collapse){
				subnavigation.css({"opacity" : "0", "top" : "-140px"});
				subnavigation.append( content ).fadeIn( kb.speed,  function(){
				  	setNavPosition(subnavigation);
				 });
			} else{
				setNavPosition(subnavigation, collapse, function(){
					subnavigation.css({"opacity" : "0", "top" : "-140px"});
				})
			}
		}


		function setPushState(title){
			var main_active = $('.slidenav-main ul li').find('.active');
			var sub_active =  $('.slidenav-sub ul li').find('.active');
			var articles_active =  $('.kb-articles ul li').find('.active');
			var search_active =  $('.kb-searchresults ul li').find('.active');

			if(articles_active.length > 0){
				history.pushState({}, '', articles_active.attr("href"));
			} else if(sub_active.length > 0){
				history.pushState({}, '', sub_active.attr("href"));
			} else if(main_active.length > 0){
				history.pushState({}, '', main_active.attr("href"));
			}	else if(search_active.length > 0){
					history.pushState({}, '', search_active.attr("href"));
			}
			//Tracking Code for GA
			  var article_title = $.trim(title);
			  dataLayer.push({ 'article title': article_title, 'event': 'Support Pageview' });
		}

		function setNavPosition(subnav, collapse){
			  var subnavigation = subnav;
			  var active_btn = $('.slidenav-main').find('.active');
			  var active_pos = active_btn.position();
			  var slide_main = $('.slidenav-main ul li');
			  var slide_sub = $('.slidenav-sub ul li');

				var parent_width = (slide_main.outerWidth(true) * slide_main.size()) / 2;
				var child_width = (slide_sub.outerWidth(true) * slide_sub.size()) / 2;
	      var margin = parseInt(slide_sub.css("marginLeft"));
				var center_line = ((parent_width - child_width)+ margin);

			  slide_sub.each(function(i, li) {
				  	var list_item = $(this);
						if(i==0){
				      $start = active_pos.left +  (active_btn.outerWidth() - $(this).outerWidth()) / 2;
						}else{
							 $button_width = slide_sub.outerWidth()*-1;
							 $start = $start + $button_width;
						}

						if(collapse){
							list_item.animate({"left" : $start+"px", "opacity" : "0"}, 400);
						}else{
							list_item.css({"left" : $start+"px"});
							subnavigation.css({"text-align" : "left"});
							subnavigation.animate( {'top':'-46px', 'opacity' : '1'}, 100)
							list_item.animate({"left" : center_line+"px", "opacity" : "1"}, 200);
						}

				});
		}


		function showBreadCrumb() {
			if ( kb.categories.visible && kb.subcategories.visible && kb.articles.visible && kb.article.visible ) {
				refreshContent( kb.breadcrumb, [
					kb.categories.node.find('.active').clone(), ' / ',
					kb.subcategories.node.find('.active').clone(), ' / ',
					kb.articles.node.find('.active').clone()
				] );
			} else {
				// hide the breadcrumb trail if stuff isn't ready
				refreshContent( kb.breadcrumb, '' );
			}
		}

		function setActive( $this ) {
			$this.parents('.kb-list').find('a').removeClass('active');
			$this.addClass('active');
		}

		if ( $('body').hasClass('kb-home') ) {

			var kb = {
				qs: { u: location.pathname },
				url: '',
				speed: 'fast',
				// cache parts of the kb page
				breadcrumb: $('.kb-breadcrumb'),
				initial: $('.kb-initial'),
				categories: {
					qs: 'category',
					target: 'subcategories',
					node: $('.kb-categories'),
					loaded: false,
					visible: false,
					activeid: '',
					activeurl: '',
					level: 1
				},
				subcategories: {
					qs: 'subcategory&cat_id=',
					target: 'articles',
					node: $('.kb-subcategories'),
					loaded: false,
					visible: false,
					activeid: '',
					activeurl: '',
					level: 2
				},
				articles: {
					qs: 'articles&subcat_id=',
					target: 'article',
					node: $('.kb-articles'),
					loaded: false,
					visible: false,
					activeid: '',
					activeurl: '',
					level: 3
				},
				article: {
					qs: 'article&id=',
					node: $('.kb-article'),
					loaded: false,
					visible: false,
					level: 4
				}
			};

			kb.subdomain = ( window.location.host.split('.')[0] == 'dev' ) ? 'dev' : 'www';
			kb.feed  = '/api/zendesk_feeds.php?callback=?&feed=';

			// handle kb-list clicks
			$('.kb-list').on( 'click', 'a', function(e) {
				e.preventDefault();

				var $this = $(this);
					// set active status
					if ($this.attr('data-part') == "subcategories") {
						$(".kb-content-lower").removeClass("article-search");
						$(".kb-searchresults").empty();
					}
					setActive( $this );
					// load the feed
					getFeed($this.data('part'), $this.data('id') );
					if ($this.data('part') != "articles" && $this.data('part') != "article") {
						$(".category-name").html($this.context.text);
					}
			});

			// handle permalinks
			if ( kb.qs.u ) {
				// querystring scenarios
				// ?u=/category/20084083/NetGauge
				// ?u=/subcategory/20620761/Configuration
				// ?u=/forum/22031346/Interface+Configuration
				var qs = kb.qs.u.split('/');

				if ( qs[2] != "" && qs[4] == "" ) {
					kb.categories.activeid = qs[2];
					getFeed('subcategories', qs[2]);
				} else if ( qs[4] != " " && qs[6] == "" ) {
					kb.subcategories.activeid = qs[4];
					getFeed('articles', qs[4]);
				} else if ( qs[6] && qs[6] != "" ) {
					kb.articles.activeid = qs[6];
					getFeed('article', qs[6])

				}
			}

		}

		function showSpinner( level ){
			$('#spinner'+level).fadeIn();
		}


		function processNav( level ){
			$common_articles = $('.common-articles');
			$common_title = $('.kb-common h5');
			$search_results = $('.kb-searchresults');
			$initial_content = $('.kb-initial');
			$lower_content = $('.kb-content-lower');
      		$lower_content.hide();
      		$initial_content.show();
      		collapseArticle();

			if(level == 2){
				$common_articles.show();
				$search_results.hide();
				$common_title.html("Common Questions");
				$initial_content.show();
				$initial_content.find('.active').removeClass('active');
			}
		 if(level == 3){
			  $search_results.hide();
	      $lower_content.fadeIn();
	      $initial_content.fadeOut();
		}
    if(level == 4){
	      $lower_content.show();
	      $initial_content.hide();
		}



	}

	// Ticket History
		$('.ticket-details-btn').on("click", function(){
			$this = $(this);
			id = $this.attr('id');
			$('.ticket-history').hide();
			$('#ticket-history-'+id).toggle();
			return false;
		})

		$(".fileupload").on("click", function(){
		    $("#attachment").trigger("click");
		    return false;
		})

		// Monitor submission of search on ticket page
			$(".kb-form-search").on("submit",function(){
				 $term = $('#search').val();
			   $('#search-term').html($term);
			   $('.kb-content-lower').hide();
			   $('.kb-subcategories').hide();
			   $('.searching').show();
			   $('.no-search-results').hide();
			});

// Translation Tool


/* Translation Builder */
$(".dynamic-placeholder input:not([value]), .dynamic-placeholder input[value='']").addClass('empty');

/* Input event handling float pattern */
$('.dynamic-placeholder input').on('input keyup', function() {
   $(this).toggleClass('empty', !Boolean($(this).val()));
});

$("#download-xml").on('click', function(){
	tranBuilder();
	if($('#xmldata').val() != ""){
		$('.download-new-xml').show();
	} else{
		$('.download-new-xml').hide();
	}

})

$("#preview-xml").on('click', function(){
	previewBuilder();
})

function previewBuilder(){

	var thisLang = $('#langInput').val();
	if(!thisLang){
		thisLang = "en";
	}

	var myXML = '<translation lang="' + thisLang + '">';

	var myTableArray = [];

	$(".dynamic-placeholder .trans-block input[type=text]").each(function() {
			var titleOfThisRow = [];
			var messageOfThisRow = [];
			titleOfThisRow.push($(this).attr('id'));
			titleOfThisRow.push($(this).val());

			if($(this).attr('data-message-exists')){
				var child = $(this).attr('data-message-exists');
				  messageOfThisRow.push(child);
					messageOfThisRow.push($("#"+child).val());
					myTableArray.push(messageOfThisRow);
			}

			myTableArray.push(titleOfThisRow);
	});

	for(var i = 0; i<myTableArray.length;i++)
	{
	if(myTableArray[i][1]){
		var xmlNode = "<text id='" +myTableArray[i][0]+ "'>"+myTableArray[i][1]+"</text>";
	myXML += "\n" + xmlNode;
	}

	}

	myXML += "</translation>";
	$.cookie('translation_xml',myXML);
}


function tranBuilder(){

	var config = $.parseXML($('#xmldata').val());

	var thisLang = $('#langInput').val();
	if(!thisLang){
		thisLang = "en";
	}

	var myXML = '&lt;translation lang="' + thisLang + '"&gt;';
	var item = $.parseXML("<translation lang='"+thisLang+"'> </translation>");
	$(config).children(0).append($(item).children(0));

	var myTableArray = [];

	$(".dynamic-placeholder .trans-block input[type=text]").each(function() {
		var titleOfThisRow = [];
		var messageOfThisRow = [];
		titleOfThisRow.push($(this).attr('id'));
		titleOfThisRow.push($(this).val());

		if($(this).attr('data-message-exists')){
			var child = $(this).attr('data-message-exists');
			messageOfThisRow.push(child);
			messageOfThisRow.push($("#"+child).val());
			myTableArray.push(messageOfThisRow);
		}

		myTableArray.push(titleOfThisRow);
	});



	for(var i = 0; i<myTableArray.length;i++)
	{
		if(myTableArray[i][1]){
			var xmlNode = '\t&lt;text id="'+myTableArray[i][0]+ '"&gt;'+myTableArray[i][1]+'&lt;/text&gt;';
			var textnode = $.parseXML("<text id='"+myTableArray[i][0]+"'>"+myTableArray[i][1]+"</text>");
			$(config).children(0).find('translation').append($(textnode).children(0));
			myXML += "\n"+xmlNode;
		}

	}

	myXML += "\n&lt;/translation&gt;";

	// Update config field with new translations
	if($('#xmldata').val() != ""){
		$('#xmldata').val(xmlToString($(config).children(0)));
	}

	document.getElementById('xmlOutput').innerHTML = myXML;

}

$('.load-config').on("click", function(){
	$('#load-config').fadeToggle();
})


$(".translation-errors .error-group a").on("click", function(){

	var current_link = $(this);

		// remove active
		$(".translation-errors .error-group").find('.active').removeClass('active');
		// set the active link
		$(this).addClass("active");

		var error_title = current_link.attr("data-error")+"title";
		var error_message = current_link.attr("data-error")+"message";
		var error_group = current_link.attr("data-group")+"-errors";
		var title = current_link.text();
		var message = current_link.attr("data-message");

		// Hide everything before creating or showing new elements.
		$(".dynamic-error-group").hide();

   // If the element doesn't exist, create it, otherwise simply show it
   if($("."+error_title).length==0){
   	$("#"+error_group).append('<span class="dynamic-error-group '+error_title+'"><input id="'+error_title+'" class="input-block-level error-input empty" data-message-exists="'+error_message+'"name="'+error_title+'"  type="text"><label for="'+error_title+'">'+title+'</label><a href="#" data-toggle="tooltip" title="Field ID: '+error_title+'"><i class="icon-ookla-info"></i></a></span>')
   	$("#"+error_group).append('<span class="dynamic-error-group '+error_title+'"><textarea id="'+error_message+'" class="translation-error-box" name="'+error_message+'" placeholder="'+message+'"></textarea></span>');
   	$('.dynamic-error-group a').tooltip();

    // Dynamically change the link text to the new translation
    $("#"+error_title).on("keyup", function(){
    	if($(this).val()!=""){
    		$(this).toggleClass('empty', !Boolean($(this).val()));
    		current_link.text($(this).val());
    	}
    })
}else{
	$("."+error_title).show()
}

return false;

});

// disable button after submit
$("#ng-inquire").submit(function() {
  $(this).find("button[type='submit']").prop('disabled',true);
});

// Captcha Ajax Call for Pardot Forms

$(".captcha_ajax").keyup(function(){
	$captcha_form = $('.verify-captcha');
	$submit_button = $('.submit_link');
	var href = $submit_button.attr("data-href");
	var postData = $captcha_form.serialize();
	$.ajax({
		type: "post",
		url: "/verify_captcha",
		data: postData,
		contentType: "application/x-www-form-urlencoded",
		success: function(response) {
			if(response == "true"){
				$submit_button.attr("href", href);
				$submit_button.css({"opacity":"1"});
				$submit_button.prop("disabled", false);
				var form_post = $('#form_post').val();
				$captcha_form.attr("action", form_post);
			}else{
				$submit_button.removeAttr("href");
				$submit_button.css({"opacity":".2"});
				$captcha_form.removeAttr("action");
			}

		},
		error: function(jqXHR, textStatus, errorThrown) {
			$submit_button.css({"opacity":".2"});
			$submit_button.removeAttr("href");
			$captcha_form.removeAttr("action");
		}
	});
})

$(".optional-comment-btn").on("click", function () {
	$(".optional-comment").show();
	$(".optional-comment-btn").hide();
	return false;
})

function validHostUrl (url) {
	var pattern = /[a-zA-Z0-9\._]+:[1-9][0-9]{3,4}/;
	url = url.toLowerCase();
	if (url.indexOf("http") >= 0) {
		return false
	} else {
		return pattern.test(url);
	}
}

$("#hosttester").on("submit", function (e) {
	var host = $("#hosttester #host").val();
	var url = $("#hosttester #url").val();
	var url2 = $("#hosttester #url2").val();
	$hostError = $(".host-error");
	if (!validHostUrl(host) && !url && !url2) {
		$hostError.html("*Invalid hostname format");
		$hostError.show();
		e.preventDefault();
	}
	$(".hoststatus-list").hide();
})

})();

/* Terms modal */
$('#termsModal .modal-body').scroll(function () {
    if ($(this).scrollTop() >= $(this)[0].scrollHeight - ($(this).height() + 100)) {
        $('.terms-agree').removeAttr('disabled');
    } else {
    	$('.terms-agree').attr('disabled', 'disabled');
    }
});

$(".terms-agree").on("click", function () {
	// if there are form errors, hide the modal.
	// use a timeout to make sure the errors have rendered
	// on the page.
	setTimeout( function () {
		if ($(".error:contains('This field is required')").length > 0)  {
			$("#termsModal").modal("hide");
		}
	}, 500)
});

/* Become a Host page */

var $prereqs = $('#prereqs input');

if ($prereqs.length > 0) { // don't run "become a host" scripts on all pages

	var $formButton = $('#show-form');

	// Require all checkboxes to use button
	$prereqs.on('click', function() {
		if ($prereqs.filter(':checked').length < $prereqs.length) {
			$formButton.prop('disabled', true);
		} else {
			$formButton.prop('disabled', false);
		}
	});

	// Autopopulate some form fields

	var autofillCopy = {
		'company': 'host-name',
		'website': 'host-url',
		'city': 'host-city',
		'region': 'host-region'
	};

	for (var srcField in autofillCopy) {
		var src = $('#' + srcField);
		src.on('blur', function() {
			var dest = $('#' + autofillCopy[this.id]);
			dest.val($(this).val());
		});
	}

	$('#email').on('blur', function() {
		var match = this.value.match(/.+@(.+)/);
		if (match) {
			$('#website').val(match[1]);
		}
	});

	$('#url').on('blur', function() {
		var match = this.value.match(/^(https?:\/\/)?([a-z\-0-9\.]+)(\/.*)?$/);
		if (match) {
			$('#ookla-server').val(match[2] + ':8080');
		}
	});

	var $countryList = $('select#country_code');

	var country = $countryList.find(":selected").text();
	
	
	$('#country-name').val(country);
	$countryList.on("change", function () {
    	country = $(this).find(":selected").text();
		$('#country-name').val(country);
	})

	var $hostSubmit = $('#host-submit');
	var $hostLoading = $('#host-loading');
	// Submit form
	$('#host-form').validate({
		rules: {
		},
		submitHandler: function() {
			// disable submit button, show loader
			$hostSubmit.prop('disabled', true);
			$hostLoading.show();
			$.ajax({
				type: 'POST',
				data: $('#host-form').serialize(),
				url: "http://beta.speedtest.net/api/js/host.php",
				success: function(data, textStatus, jqXHR) {
					if (!data) {
						console.log('Something went wrong - no response data');
					} else if (data.status) {
						$('.modal-backdrop, #host-modal').hide();
						$('h1').html('Thank you');
						$('#host-content').text("Your host inquiry was successfully submitted. We will do our best to respond in a timely manner.");
						dataLayer.push({'event': 'hostFormSubmit'});
					} 
					$hostSubmit.prop('disabled', false);
					$hostLoading.hide();
				},
				statusCode: {
					422: function (res) {
						var data = $.parseJSON(res.responseText);
						// hide errors from previous submits
						$('.error').hide();
						// show errors from this POST
						$('#check-errors').show();
						var text; 
						for (var field in data.errors) {
							if (data.errors[field] == "error_upload_valid") {
								text = "<p>Upload urls must end in upload.php, .asp, .aspx, or .jsp and cannot use a custom port</p>";
							} else if (data.errors[field] == "error_ookla_port") {
								text = "<p>Ookla server requires port 8080.</p>"; 
							} else if (data.errors[field] == "error_upload_ip") {
								text = "<p>Upload urls must both have the same IP address.</p>";
							} else if (data.errors[field] == "error_upload_unique") {
								text = "<p>Upload urls must be different.</p>";
							} else if (data.errors[field] == "error_upload_connection_1") {
								text = "<p>We were unable to download from your first upload url.</p>";
							} else if (data.errors[field] == "error_upload_connection_2") {
								text = "<p>We were unable to download from your second upload url.</p>";
							} else if (data.errors[field] == "error_ookla_required") {
								text = "<p>Please enter your Ookla server.</p>";
							} else if (data.errors[field] == "error_ookla_connection") {
								text = "<p>We were unable to test against the Ookla server you provided.</p>";
							} else if (data.errors[field] == "error_hosted_by") {
								text = "<p>Please fill out all Hosted By fields.</p>";
							} else if (data.errors[field] == "error_host_registration_generic") {
								text = "<p>An error occured while processing your host registration.  Please contact us directly for further assistance.</p>";
							} else if (data.errors[field] == "error_upload_cross_domain") {
								text = "<p>Verify that crossdomain.xml is located in the server's root directory and is in the proper format.</p>";
							} else if (data.errors[field] == "error_host_registration_exists") {
								text = "<p>This Ookla Server url has already been submitted.</p>";
							}
								
							$('#error_general').append(text).show();
						}
						// scroll to top of form
						$('#host-modal-content').scrollTop(0);
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					$hostSubmit.prop('disabled', false);
					$hostLoading.hide();
					console.error(jqXHR);
				}
			});
		},
	});

	/* TODO remove once debugging is done
	$hostSubmit.on('click', function() {
		// disable submit button, show loader
		$hostSubmit.prop('disabled', true);
		$hostLoading.show();
		$.ajax({
			type: 'POST',
			data: $('#host-form').serialize(),
			url: window.location,
			success: function(data, textStatus, jqXHR) {
				if (!data) {
					console.log('Something went wrong - no response data');
				} else if (data.success) {
					$('.modal-backdrop, #host-modal').hide();
					$('h1').html('Thank you');
					$('#host-content').text(data.success);
				} else {
					// hide errors from previous submits
					$('.error').hide();
					// show errors from this POST
					$('#check-errors').show();
					for (var field in data.errors) {
						$('div#'+field).text(data.errors[field]).show();
					}
					// scroll to top of form
					$('#host-modal-content').scrollTop(0);
				}
				$hostSubmit.prop('disabled', false);
				$hostLoading.hide();
			},
			error: function(jqXHR, textStatus, errorThrown) {
				$hostSubmit.prop('disabled', false);
				$hostLoading.hide();
				console.log(errorThrown);
			}
		});
	});
	*/


}

$("body").on("click", 'a[href^="#"]', function (e) {
	e.preventDefault();
	var target = this.hash;
	var $target = $(target);
	$("html, body").stop().animate({
		"scrollTop": $target.offset().top - 80
	}, 250, function () {
		window.location.hash = target;
	});
});

/*
 * jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
 *
 * Uses the built in easing capabilities added In jQuery 1.1
 * to offer multiple easing options
 *
 * TERMS OF USE - EASING EQUATIONS
 *
 * Open source under the BSD License.
 *
 * Copyright © 2001 Robert Penner
 * All rights reserved.
 *
 * TERMS OF USE - jQuery Easing
 *
 * Open source under the BSD License.
 *
 * Copyright © 2008 George McGinley Smith
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list of
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list
 * of conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 *
 * Neither the name of the author nor the names of contributors may be used to endorse
 * or promote products derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
*/
jQuery.easing.jswing=jQuery.easing.swing;jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(e,f,a,h,g){return jQuery.easing[jQuery.easing.def](e,f,a,h,g)},easeInQuad:function(e,f,a,h,g){return h*(f/=g)*f+a},easeOutQuad:function(e,f,a,h,g){return -h*(f/=g)*(f-2)+a},easeInOutQuad:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f+a}return -h/2*((--f)*(f-2)-1)+a},easeInCubic:function(e,f,a,h,g){return h*(f/=g)*f*f+a},easeOutCubic:function(e,f,a,h,g){return h*((f=f/g-1)*f*f+1)+a},easeInOutCubic:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f+a}return h/2*((f-=2)*f*f+2)+a},easeInQuart:function(e,f,a,h,g){return h*(f/=g)*f*f*f+a},easeOutQuart:function(e,f,a,h,g){return -h*((f=f/g-1)*f*f*f-1)+a},easeInOutQuart:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f*f+a}return -h/2*((f-=2)*f*f*f-2)+a},easeInQuint:function(e,f,a,h,g){return h*(f/=g)*f*f*f*f+a},easeOutQuint:function(e,f,a,h,g){return h*((f=f/g-1)*f*f*f*f+1)+a},easeInOutQuint:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f*f*f+a}return h/2*((f-=2)*f*f*f*f+2)+a},easeInSine:function(e,f,a,h,g){return -h*Math.cos(f/g*(Math.PI/2))+h+a},easeOutSine:function(e,f,a,h,g){return h*Math.sin(f/g*(Math.PI/2))+a},easeInOutSine:function(e,f,a,h,g){return -h/2*(Math.cos(Math.PI*f/g)-1)+a},easeInExpo:function(e,f,a,h,g){return(f==0)?a:h*Math.pow(2,10*(f/g-1))+a},easeOutExpo:function(e,f,a,h,g){return(f==g)?a+h:h*(-Math.pow(2,-10*f/g)+1)+a},easeInOutExpo:function(e,f,a,h,g){if(f==0){return a}if(f==g){return a+h}if((f/=g/2)<1){return h/2*Math.pow(2,10*(f-1))+a}return h/2*(-Math.pow(2,-10*--f)+2)+a},easeInCirc:function(e,f,a,h,g){return -h*(Math.sqrt(1-(f/=g)*f)-1)+a},easeOutCirc:function(e,f,a,h,g){return h*Math.sqrt(1-(f=f/g-1)*f)+a},easeInOutCirc:function(e,f,a,h,g){if((f/=g/2)<1){return -h/2*(Math.sqrt(1-f*f)-1)+a}return h/2*(Math.sqrt(1-(f-=2)*f)+1)+a},easeInElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k)==1){return e+l}if(!j){j=k*0.3}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}return -(g*Math.pow(2,10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j))+e},easeOutElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k)==1){return e+l}if(!j){j=k*0.3}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}return g*Math.pow(2,-10*h)*Math.sin((h*k-i)*(2*Math.PI)/j)+l+e},easeInOutElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k/2)==2){return e+l}if(!j){j=k*(0.3*1.5)}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}if(h<1){return -0.5*(g*Math.pow(2,10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j))+e}return g*Math.pow(2,-10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j)*0.5+l+e},easeInBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}return i*(f/=h)*f*((g+1)*f-g)+a},easeOutBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}return i*((f=f/h-1)*f*((g+1)*f+g)+1)+a},easeInOutBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}if((f/=h/2)<1){return i/2*(f*f*(((g*=(1.525))+1)*f-g))+a}return i/2*((f-=2)*f*(((g*=(1.525))+1)*f+g)+2)+a},easeInBounce:function(e,f,a,h,g){return h-jQuery.easing.easeOutBounce(e,g-f,0,h,g)+a},easeOutBounce:function(e,f,a,h,g){if((f/=g)<(1/2.75)){return h*(7.5625*f*f)+a}else{if(f<(2/2.75)){return h*(7.5625*(f-=(1.5/2.75))*f+0.75)+a}else{if(f<(2.5/2.75)){return h*(7.5625*(f-=(2.25/2.75))*f+0.9375)+a}else{return h*(7.5625*(f-=(2.625/2.75))*f+0.984375)+a}}}},easeInOutBounce:function(e,f,a,h,g){if(f<g/2){return jQuery.easing.easeInBounce(e,f*2,0,h,g)*0.5+a}return jQuery.easing.easeOutBounce(e,f*2-g,0,h,g)*0.5+h*0.5+a}});
