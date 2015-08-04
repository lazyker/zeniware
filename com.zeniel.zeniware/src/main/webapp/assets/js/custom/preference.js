/**
 * 
 */

/* bootstrap modal initialize */
var modalInit = function(show, title, message, primary, secondary) {
	if (show == true) {
		if (!jQuery.isEmptyObject(title)) $('#mdl .modal-title').html(title);
		if (!jQuery.isEmptyObject(message)) $('#mdl .modal-body').html(message);
		if (!jQuery.isEmptyObject(primary)) $('#mdl .btn-info').html(primary);
		if (!jQuery.isEmptyObject(secondary)) $('#mdl .btn-white').html(secondary);
		
		jQuery('#mdl').modal('show', { backdrop: 'fade' });
		
	} else {
		jQuery('#mdl').modal('hide');
	}
};

$(document).ready(function() {
	
	/* select2 initialize */
	$('select').select2({
		placeholder: "선택하세요...", 
		allowClear: true
	}).on('select2-open', function() {
		$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
	});
	
	/* toastr initialize */
	toastr.options.closeButton = true;
	toastr.options.positionClass = "toast-top-full-width";

});