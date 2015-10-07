/* Global */

// Scrolling function
function scrollToAnchor(id_selector){
  $('html,body').animate({ scrollTop: id_selector.offset().top - 52 }, 300);
};

function enable_tooltips() {
	$('[data-toggle="tooltip"]').tooltip();
};

function bind_group_filter() {
	//filter by group
	$('.group-nav-item').click(function(event) {
		filter_by_group($(this));
	});
};

function filter_by_group(group_element) {
	group_id = group_element.attr('id');
	// Current filter?
	if(!group_element.hasClass('group-nav-current')) {
		$('.group-nav-current').removeClass('group-nav-current');
		group_element.addClass('group-nav-current');
		$('.entry').show();
		if(!group_element.hasClass('group-all')) {
			$('.entry:not(.' + group_id + ')').hide();
		}
	}
};

function menu_selection() {
	if($('#accordion').length) {
		var $accordion = $("#accordion");
	};
};

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
	//reset login and signup
	$('#signup, #login').hide();
	$('#signup-btn').removeClass('clicked');
	//inputs
	$('.in-field').val() != '' ? $('.in-field').parent().addClass('in-filled') : $('.in-field').parent().removeClass('in-filled')
	$('.in-field').bind("propertychange change click keyup input paste", function(event) {
	  $(this).val() != '' ? $(this).parent().addClass('in-filled') : $(this).parent().removeClass('in-filled')
	});

	bind_group_filter();
	enable_tooltips();
	menu_selection();
});