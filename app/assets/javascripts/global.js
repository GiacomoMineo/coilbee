/* Global */

// Scrolling function
function scrollToAnchor(id_selector){
  $('html,body').animate({ scrollTop: id_selector.offset().top - 52 }, 300);
};

// Tooltip enabler
function enable_tooltips() {
	$('[data-toggle="tooltip"]').tooltip();
};

// Group filter binder
function bind_group_filter() {
	//filter by group
	$('.group-nav-item').click(function() {
		filter_by_group($(this));
	});
};

// Group filter renderer
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

ready = function() {

	// Initialization
	//inputs
	$('.in-field').each(function() {
		$(this).val() != '' ? $(this).parent().addClass('in-filled') : $(this).parent().removeClass('in-filled');
	});
	$('.in-field').bind("propertychange change click keyup input paste", function(event) {
	  $(this).val() != '' ? $(this).parent().addClass('in-filled') : $(this).parent().removeClass('in-filled')
	});
	//disable ajax buttons before firing
	$('#login_form, #signup_form, #feedback_form').find('.in-submit').click(function() {
		$(this).prop("disabled", true);
		$(this).parents('form').submit();
	});
	//reset login and signup
	$('#signup, #login').hide();
	$('#signup-btn').removeClass('clicked');

	//user dropdown
	$('.user-toggle').click(function(e) {
		e.stopPropagation();
		$('.user-dropdown').toggle();
	});
	$('html, body').click(function() {
		if($(window).width()>768){
			$('.user-dropdown').hide();
		};
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

	// upvote login prompt
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
		$('#login-btn.landing').removeClass('clicked');
	    if($(this).hasClass('clicked')) {
	      $('html, body').animate({
	        scrollTop: $(this).offset().top - 88
	      }, 300);
	    };
	});
	//login panel
	$('#login-btn.landing').click(function(e) {
		e.preventDefault();
		$btn_element = $(this);
		$btn_element.toggleClass('clicked');
		$('#login').slideToggle(300);
		$('#signup-btn.landing').removeClass('clicked');
		$('#signup').slideUp(300, function() {
			if($btn_element.hasClass('clicked')) {
			    $('html, body').animate({
			    	scrollTop: $btn_element.offset().top - 76
			    }, 300);
		    };
		});
	});

	//suggestions
	// Filter out cookied suggestions
	function filterTips() {
		$('.tip').each(function() { $(this).hide(); });
		$('.tip').each(function() {
			one = true;
			if(typeof(Cookies.get($(this).attr('id'))) == 'undefined') {
				$(this).show();
				one = false;
			};
			return one;
		});
	};
	
	// Bind new tips
	$('.tip-done').click(function() {
		$popup = $(this).parent();
		Cookies.set($popup.attr('id'), true);
		$popup.fadeOut(300, function() { filterTips(); });
	});

	filterTips();

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
	$('.footer-panel .close-popup').click(function() {
		$('.footer-panel > div').hide();
		$('#feedback_form .in-error').html("");
	});
	$('body,html').click(function() {
		$('.footer-panel > div').hide();
		$('#feedback_form .in-error').html("");
	});

	// Library buttons
	$('.library-buttons #menu-toggle').click(function(element) {
		$('.aside-content').stop();
		if($('.aside-content').hasClass('shrunk')) {
			$('.aside-content').animate({ left: '0'}, 300);
		} else {
			$('.aside-content').animate({ left: '-100%'}, 300);
		}
		$('.aside-content').toggleClass('shrunk')
		if($('.main-content').hasClass('expanded')) {
			$('.main-content').addClass('col-lg-7 col-lg-offset-4 col-sm-9 col-sm-offset-3 col-xs-12');
			$('.main-content').removeClass('col-lg-10 col-lg-offset-1 col-xs-12');
		} else {
			$('.main-content').removeClass('col-lg-7 col-lg-offset-4 col-sm-9 col-sm-offset-3 col-xs-12');
			$('.main-content').addClass('col-lg-10 col-lg-offset-1 col-xs-12');
		}
		$('.main-content').toggleClass('expanded');
	});

	bind_group_filter();
	enable_tooltips();
};

// Doc ready
$(document).ready(ready);
$(document).on('page:load', ready);
