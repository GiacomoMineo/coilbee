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
	$('.group-nav-item').click(function() {
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

function menu_current_selection() {
	if($('#accordion').length) {
		$($('#collapse_current').attr('href')).collapse();
	};
};

// Doc ready
$(function() {
	
});

// Page change event
$(document).on('page:change', function(event) {

	// Initialization

	//user ajax
	$(document).ajaxComplete(function(event, xhr, settings) {
		// Login
		if(settings.url == '/users/sign_in') {
			//Success
			if(xhr.status == '201') {
				$('#login_form .in-submit').addClass('success').attr('value', 'Success!');
				window.location.reload();
			}
			//Error
			if(xhr.status == '401') {
				$('#login_form .in-error').html(xhr.responseText);
			}
		}
		// Signup
		if(settings.url == '/users') {
			// Success
			if(xhr.status == '201') {
				$('#signup_form .in-submit').addClass('success').attr('value', 'Success!');
				window.location.reload();
			}
			// Error
			if(xhr.status == '422') {
				errorText = "";
				$.each(jQuery.parseJSON(xhr.responseText).errors, function(key, value) {
					errorText += "<span>" + key + " " + value + "</span>";
				})
				$('#signup_form .in-error').html(errorText);
			}
		}
	});
	//inputs
	$('.in-field').each(function() {
		$(this).val() != '' ? $(this).parent().addClass('in-filled') : $(this).parent().removeClass('in-filled');
	});
	$('.in-field').bind("propertychange change click keyup input paste", function(event) {
	  $(this).val() != '' ? $(this).parent().addClass('in-filled') : $(this).parent().removeClass('in-filled')
	});

	//user dropdown
	$('.user-toggle').click(function(e) {
		e.stopPropagation();
		$('.user-dropdown').toggle();
	});
	$('html, body').click(function() {
		$('.user-dropdown').hide();
	});

	//signup and login button popups
	$('.signup-btn:not(.landing)').click(function(e) {
		e.preventDefault();
		$('.overlay').hide();
		$('#signup-popup').fadeIn(200);
	});
	$('.login-btn:not(.landing)').click(function(e) {
		e.preventDefault();
		$('.overlay').hide();
		$('#login-popup').fadeIn(200);
	});
	$('.close-popup').click(function() {
		$('.overlay').hide();
	});
	$('.popup').click(function(e) {
		e.stopPropagation();
	})
	$('.overlay').click(function() {
		$('.overlay').hide();
	});

	// upvote redirect TODO
	$('.upvote.not-logged, .downvote.not-logged').click(function(e) {
		e.stopImmediatePropagation();
		e.preventDefault();
		$('.overlay').hide();
		$('#prompt-popup').fadeIn(200);
	});

	//signup panel
	$('#signup-btn.landing').click(function(e) {
		e.preventDefault();
		$(this).toggleClass('clicked');
		$(this).blur();
		$('#signup').slideToggle(300);
		$('#login').slideUp(300);
		$('#login-btn').removeClass('clicked');
	    if($(this).hasClass('clicked')) {
	      $('html, body').animate({
	        scrollTop: $(this).offset().top - 88
	      }, 300);
	    };
	});
	//login panel
	$('#login-btn.landing').click(function(e) {
		$btn_element = $(this);
		e.preventDefault();
		$('#login').slideToggle(300);
		$btn_element.toggleClass('clicked');
		$('#signup-btn').removeClass('clicked');
		$('#signup').slideUp(300, function() {
			if($btn_element.hasClass('clicked')) {
		      $('html, body').animate({
		        scrollTop: $btn_element.offset().top - 76
		      }, 300);
		    };
		});
	});
	//reset login and signup
	$('#signup, #login').hide();
	$('#signup-btn').removeClass('clicked');

	//footer
	$('#feedback, #social').hide();
	$('.footer-links a').click(function(event) {
		id = $(this).attr('href')
		if(id == '#social' ||
		   id == '#feedback') {
		   	event.stopPropagation();
		    event.preventDefault();
		   	$('.footer-panel > div:not(' + id + ')').hide();
		   	$(id).slideToggle(200);
		} else {
			event.stopPropagation();
		}
	});
	$('.footer-panel').click(function(e) { e.stopPropagation(); });
	$('.footer-panel .close-popup').click(function() { $('.footer-panel > div').hide(); });
	$('body,html').click(function() {
		$('.footer-panel > div').hide();
	});

	bind_group_filter();
	enable_tooltips();
	menu_current_selection();
});