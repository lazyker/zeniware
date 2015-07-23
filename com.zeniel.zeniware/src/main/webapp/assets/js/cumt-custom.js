$(document).ready(function() {
	
	//일정등록 화면 이동 이벤트
	$('#cumtWrite').on('click', function() {
		var date = new Date();
		var today = date.format("yyyy-MM-dd");	
		alert("준비중 입니다.");
		return;
		//window.location.href =  getContextPath() + "/cumnity/cumtMainWrite";
	});
	
});

/* ContextPath 가져오기 함수 */
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}