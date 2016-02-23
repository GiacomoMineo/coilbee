function share_resource() {
	$('.share').click(function(event, $element) {
		event.preventDefault();
		referrer = $element.attr('href')
		switch(referrer) {
			case 'facebook':

			default:
				break;
		};
	});
}