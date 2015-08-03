$(document).ready(function() {
	
	//일정등록 화면 이동 이벤트
	$('#comtWrite').on('click', function() {
		window.location.href =  getContextPath() + "/cumnity/comtMainWrite";
	});
	
});

/* ContextPath 가져오기 함수 */
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

/* toastr initialize */
var toastrInit = function() {
	toastr.options.closeButton = true;
	toastr.options.positionClass = "toast-top-full-width";
}

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