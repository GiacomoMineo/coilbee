function share_resource() {
	// Share popup
	$('.entry-share').click(function(event) {
		event.preventDefault();

		$share_popup = $(this).parent().find('.entry-share-popup');
		$share_popup.find('.entry-share-link').hide();
		$share_popup.find('.share-link-alert').hide();
		// Hide all popups
		$('.entry-share-popup').hide();
		if($(this).hasClass('popped')) {
			$(this).find('.glyphicon').removeClass('glyphicon-remove').addClass('glyphicon-share-alt');
			$('.entry-share').removeClass('popped');
		} else {
			$('.entry-share').removeClass('popped');
			$(this).addClass('popped');
			$('.entry-share').find('.glyphicon').removeClass('glyphicon-remove').addClass('glyphicon-share-alt');
			$(this).find('.glyphicon').removeClass('glyphicon-share-alt').addClass('glyphicon-remove');
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