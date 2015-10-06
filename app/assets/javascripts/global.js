/* Global */

// Scrolling function
function scrollToAnchor(id_selector){
  $('html,body').animate({ scrollTop: id_selector.offset().top - 52 }, 300);
}

function filter_by_group(group_element) {
	group_id = group_element.attr('id');
	if(!group_element.hasClass('group-nav-current')) {
		$('.group-nav-current').removeClass('group-nav-current');
		group_element.addClass('group-nav-current');
		$('.entry').show();
		$('.entry:not(.' + group_id + ')').hide();
	} else {
		group_element.removeClass('group-nav-current');
		$('.entry').show();
	}
}

// Doc ready
$(function() {
	
});

// Page change event
$(document).on('page:change', function(event) {

	// Initialization

	//signup panel
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
	//login panel
	$('#login-btn').click(function(e) {
		e.preventDefault();
		$('#login').slideToggle(300);
		$('#signup').slideUp(300);
		$('#signup-btn').removeClass('clicked');
	});
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
	//filter by group
	$('.group-nav-item').click(function(event) {
		filter_by_group($(this));
	});
});