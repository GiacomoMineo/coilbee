function share_resource() {
	// Share popup
	$('.share').click(function(event) {
		event.preventDefault();

		$share_popup = $(this).parent().parent().parent().find('.entry-share');
		$share_popup.find('.entry-share-link').hide();
		$share_popup.find('.share-link-alert').hide();
		// Hide all popups
		$('.entry-share').hide();
		if($(this).hasClass('opened')) {
			$(this).find('.icon-small').removeClass('glyphicon-remove').addClass('glyphicon-share-alt');
			$('.share').removeClass('opened');
		} else {
			$('.share').removeClass('opened');
			$(this).addClass('opened');
			$('.share').find('.icon-small').removeClass('glyphicon-remove').addClass('glyphicon-share-alt');
			$(this).find('.icon-small').removeClass('glyphicon-share-alt').addClass('glyphicon-remove');
			$share_popup.show();
		}
	});

	// Share link
	$('.share-link').click(function(event) {
		event.preventDefault();

		$share_link_alert = $(this).parent().find('.share-link-alert');
		$share_link_alert.toggle();

		$share_link_popup = $(this).parent().parent().parent().find('.entry-share-link');
		$share_link_popup.toggle();
		$share_link_popup.find('input').select();

		document.execCommand('copy');
	});
}