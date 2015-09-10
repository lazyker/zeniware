$(document).ready(function() {
	
	//커뮤니티 화면 이동 이벤트
	$('#comtWrite').on('click', function() {
		window.location.href =  getContextPath() + "/cumnity/comtMainWrite";
	});

	//커뮤니티내의 게시판 생성 이동 이벤트
	$('#boardNewComt').on('click', function() {
		window.location.href =  getContextPath() + "/comtBoard/comtNewBoardWrite";
	});

	//커뮤니티내의 게시판 글쓰기 화면 이동 이벤트-comtBoardWrite
	$('#comtBoardNewWrite').on('click', function() {
		window.location.href =  getContextPath() + "/comtBoard/comtBoardWrite";
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