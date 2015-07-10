<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
	<tiles:insertAttribute name="header" />
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/fullcalendar/fullcalendar.min.css">
	<link rel="stylesheet" href='${pageContext.request.contextPath}/assets/js/fullcalendar/fullcalendar.print.css' media='print' />

<body class="page-body horizontal-menu-skin-navy">

	<tiles:insertAttribute name="top" />

	<div class="page-container">
		<tiles:insertAttribute name="leftFm" />
		
		<div class="main-content">
			<tiles:insertAttribute name="body" />
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
	<script src="${pageContext.request.contextPath}/assets/js/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/ajax.js"></script>
	
	<!-- JavaScripts initializations and stuff -->
	<script src="${pageContext.request.contextPath}/assets/js/xenon-custom.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/schedule-custom.js"></script>
		
</body>
</html>