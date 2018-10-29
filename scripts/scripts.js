// Namespace
var VAHEP = VAHEP || {};

// Global Vars
var animationSpeed = 250;

// Tell the DOM that JS is enabled
document.body.className += ' js-enabled';

// Detect for Mouse vs. Keyboard events for accessibility helpers
document.addEventListener('keydown', function (e) {
  if (e.keyCode === 9) {
    jQuery('html').addClass('keyboard-user');
  }
});

document.addEventListener('mousedown', function (e) {
  jQuery('html').removeClass('keyboard-user');
});


// Accordion (Level 1 Menus)
VAHEP.accordionMenu = (function ($) {

  function init(){

    var $accordionMenu = $('.accordion-menu');
    var $accordionToggle = $accordionMenu.find('.toggle');
    var $accordionExpandAll = $accordionMenu.find('.expand-all');

    // open/close accordion
    $accordionToggle.on('click', function(e) {

      if (!$(this).is('.active')) {
        $(this).addClass('active').attr('aria-expanded', 'true');
        $(this).siblings('.submenu').slideDown(animationSpeed);
      }
      else {
        $(this).removeClass('active').attr('aria-expanded', 'false');
        $(this).siblings('.submenu').slideUp(animationSpeed);
      }
    });

    // Expand All Button
    $accordionExpandAll.on('click', function(e) {

      if (!$(this).is('.active')) {

        $(this).text('- Collapse all').addClass('active').attr('aria-expanded', 'true');

        $accordionMenu.each(function() {
          $(this).find('.toggle').addClass('active').attr('aria-expanded', 'true');
          $(this).find('.submenu').slideDown(animationSpeed);
        });

      }
      else {

        $(this).text('+ Expand all').removeClass('active').attr('aria-expanded', 'false');

        $accordionMenu.each(function() {
          $(this).find('.toggle').removeClass('active').attr('aria-expanded', 'false');
          $(this).find('.submenu').slideUp(animationSpeed);
        });

      }

    });

  }

  if($('.accordion-menu').length) {
    init();
  }

})(jQuery);
