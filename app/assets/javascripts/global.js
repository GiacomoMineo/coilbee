/* Global */

// Scrolling function
function scrollToAnchor(id_selector){
  $('html,body').animate({ scrollTop: id_selector.offset().top - 52 }, 300);
}

// Doc ready
$(function() {
	// Signup panel
	$('#signup-btn').click(function(e) {
		e.preventDefault();
		$(this).toggleClass('clicked');
		$(this).blur();
		$('#signup').slideToggle(300);
		$('#login').slideUp(300);
    if($(this).hasClass('clicked')) {
      $('html, body').animate({
        scrollTop: $(this).offset().top - 88
      }, 300);
    };
	});
	// Login panel
	$('#login-btn').click(function(e) {
		e.preventDefault();
		$('#login').slideToggle(300);
		$('#signup').slideUp(300);
		$('#signup-btn').removeClass('clicked');
	});
  
});

// Page change event
$(document).on('page:change', function(event) {

	// Initialization


	//inputs
	$('.in-field').val() != '' ? $('.in-field').parent().addClass('in-filled') : $('.in-field').parent().removeClass('in-filled')
	$('.in-field').bind("propertychange change click keyup input paste", function(event) {
	  $(this).val() != '' ? $(this).parent().addClass('in-filled') : $(this).parent().removeClass('in-filled')
	});
	//reset login and signup
	$('#signup, #login').hide();
	$('#signup-btn').removeClass('clicked');
	//enable tooltips
  $('[data-toggle="tooltip"]').tooltip();
  //bind scrolling anchors
  $('.group-nav-item a').click(function(e) {
    e.preventDefault();
    if(!($(this).parent().hasClass('group-nav-current'))) {
      scrollToAnchor($($(this).attr('href')));
    }
  });
});