<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
	<tiles:insertAttribute name="header" />
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/fullcalendar/fullcalendar.min.css">
	<link rel="stylesheet" href='${pageContext.request.contextPath}/assets/js/fullcalendar/fullcalendar.print.css' media='print' />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/simplecolorpicker/css/jquery.simplecolorpicker.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/simplecolorpicker/css/jquery.simplecolorpicker-glyphicons.css">

<body class="page-body horizontal-menu-skin-navy">

	<tiles:insertAttribute name="top" />

	<div class="page-container">
		<tiles:insertAttribute name="leftFm" />
		
		<div class="main-content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	
	<!-- 스케줄 상세 모달 -->
	<div class="modal fade" id="schedModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Dynamic Content</h4>
				</div>
				
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-1" class="control-label"><p>일시</p></label>
								djlfkdsjfl
							</div>	
							
							<div class="form-group">
								<label for="field-1" class="control-label">캘린더 이름</label>
								
								djlfkdsjfl
							</div>	
							
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="schedDelBtn">삭제</button>
					<button type="button" class="btn btn-white" id="schedModifyBtn">수정</button>
				</div>
			</div>
		</div>
	</div>	
	
	<!-- Bottom Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/TweenMax.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/resizeable.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/joinable.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/xenon-api.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/xenon-toggles.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
	
	<!-- Imported scripts on this page -->
	<script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/fullcalendar/fullcalendar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datepicker/locales/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/assets/js/timepicker/bootstrap-timepicker.min.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/assets/js/colorpicker/bootstrap-colorpicker.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/assets/js/simplecolorpicker/jquery.simplecolorpicker.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/toastr/toastr.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/ajax.js"></script>
	
	<!-- JavaScripts initializations and stuff -->
	<script src="${pageContext.request.contextPath}/assets/js/xenon-custom.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/schedule-custom.js"></script>
		
</body>
</html>