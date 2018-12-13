// Namespace
var VAHEP = VAHEP || {};

// Global Vars
var animationSpeed = 200;

// Tell the DOM that JS is enabled
jQuery('html').addClass('js-enabled');

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

    var $accordionMenu = $('.accordion-menu, .faq-menu');
    var $accordionToggle = $accordionMenu.find('.toggle');
    var $accordionExpandAll = $accordionMenu.find('.expand-all');

    // open/close accordion
    $accordionToggle.on('click', function(e) {

      if (!$(this).is('.active')) {
        $(this).addClass('active').attr('aria-expanded', 'true');
        $(this).siblings('.submenu, .answer').slideDown(animationSpeed);
      }
      else {
        $(this).removeClass('active').attr('aria-expanded', 'false');
        $(this).siblings('.submenu, .answer').slideUp(animationSpeed);
      }

    });

    // Expand All Button
    $accordionExpandAll.on('click', function(e) {

      if (!$(this).is('.active')) {

        $(this).html('<span>-</span> Collapse all').addClass('active').attr('aria-expanded', 'true');

        $(this).parent('.accordion-menu, .faq-menu').each(function() {
          $(this).find('.toggle').addClass('active').attr('aria-expanded', 'true');
          $(this).find('.submenu, .answer').slideDown(animationSpeed);
        });

      }
      else {

        $(this).html('<span>+</span> Expand all').removeClass('active').attr('aria-expanded', 'false');

        $(this).parent('.accordion-menu, .faq-menu').each(function() {
          $(this).find('.toggle').removeClass('active').attr('aria-expanded', 'false');
          $(this).find('.submenu, .answer').slideUp(animationSpeed);
        });

      }

    });

    // if no submenu exists, add class to style differenty

    $($accordionMenu).find('> ul > li').each(function(i) {
      if (!$(this).find('li').length) {
        $(this).addClass('no-submenu');
      }
    });

  }

  if($('.accordion-menu, .faq-menu').length) {
    init();
  }

})(jQuery);

// Responsive Tables, Use data attribute
VAHEP.respsonsiveTables = (function ($) {

  function init(){

    var $table = $('table.responsive');

    $table.each(function() {

      var headertext = [];
      var $headers = $(this).find('tr:first-child td, tr:first-child th');
      var $tableRow = $(this).find('tr');

      $headers.each(function(i) {
        headertext.push($(this).text().trim());
      });

      $tableRow.each(function() {
        $(this).find('td').each(function(i) {
          $(this).attr('data-label', headertext[i]);
        });
      });

    });

  }

  if($('table.responsive').length) {
    init();
  }

})(jQuery);
