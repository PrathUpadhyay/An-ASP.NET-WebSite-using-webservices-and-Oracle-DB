var ooklaBanner = {

  $slides: null,
  $slideIndicators: null,
  currentSlide: 0,
  timer: null,

  /* hide previous slide and show active */
  activate: function activate(prev, active) {
    ooklaBanner.$slides.eq(prev).removeClass('is-active');
    ooklaBanner.$slides.eq(active).addClass('is-active');

    ooklaBanner.$slideIndicators.eq(prev).removeClass('active');
    ooklaBanner.$slideIndicators.eq(active).addClass('active');
  },

  /* move forward one slide */
  forward: function forward() {
    var prev = ooklaBanner.currentSlide;
    ooklaBanner.currentSlide = prev===ooklaBanner.$slides.length-1 ? 0 : prev + 1;
    ooklaBanner.activate(prev, ooklaBanner.currentSlide);
  },

  /* go to a specific slide */
  goTo: function goTo(slide) {
    // if chosen slide is invalid or equal to current, do nothing
    if (slide === ooklaBanner.currentSlide || slide < 0 || slide >= ooklaBanner.$slides.length) {
      return;
    }
    var prev = ooklaBanner.currentSlide;
    ooklaBanner.currentSlide = slide;
    ooklaBanner.activate(prev, slide);
    // restart slide timer
    ooklaBanner.timer = window.clearInterval(ooklaBanner.timer);
    ooklaBanner.startSlideshow();

  },

  /* initiate the slideshow:
   *   cache reference to slides
   *   set click handlers on slide buttons
   *   setInterval to call forward() */
  startSlideshow: function() {
    ooklaBanner.$slides = $('.slideshow');
    ooklaBanner.$slideIndicators = $('.slide-indicator');
    ooklaBanner.$slideIndicators.on('click', function() {
      ooklaBanner.goTo($(this).index());
    });
    if (!ooklaBanner.timer) {
      ooklaBanner.timer = window.setInterval(ooklaBanner.forward, 10000);
    }
  }

};

$(document).ready(function() {
  ooklaBanner.startSlideshow();
});
