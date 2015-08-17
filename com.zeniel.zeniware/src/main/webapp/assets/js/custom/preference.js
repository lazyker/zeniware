/**
 * 
 */

/* bootstrap modal initialize */
var modalInit = function(show, title, message, primary, secondary, width, height) {
	if (show == true) {
		if (!jQuery.isEmptyObject(title)) $('.modal .modal-title').html(title);
		if (!jQuery.isEmptyObject(message)) $('.modal .modal-body').html(message);
		if (!jQuery.isEmptyObject(primary)) $('.modal .btn-info').html(primary);
		if (!jQuery.isEmptyObject(secondary)) $('.modal .btn-white').html(secondary);
		if (!jQuery.isEmptyObject(width)) $('.modal .modal-dialog').width(width);
		
		if (!jQuery.isEmptyObject(height)) {
			$('.modal .modal-body').css({ 'height': height, 'overflow-y': 'auto' });
		} else {
			$('.modal .modal-body').css({ 'height': '100%', 'overflow-y': 'hidden' });
		}
		
		jQuery('.modal').modal('show', { backdrop: 'fade' });
		
	} else {
		jQuery('.modal').modal('hide');
	}
};

$(document).ready(function() {
	
	$('select').select2({
		placeholder: "선택하세요...", 
		allowClear: true
	}).on('select2-open', function() {
		$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
	});

});