function share_resource() {
	// Share popup
	$('.share').click(function(event) {
		event.preventDefault();

		$share_popup = $(this).parent().parent().parent().find('.entry-share');
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
}