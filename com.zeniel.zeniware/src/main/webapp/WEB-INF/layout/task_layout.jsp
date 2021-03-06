<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
	<title><tiles:getAsString name="title"/></title>
	<tiles:insertAttribute name="header" />
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/select2/select2.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/select2/select2-bootstrap.css">
	
</head>

<body class="page-body horizontal-menu-skin-navy skin-default">
	
	<tiles:insertAttribute name="top" />

	<div class="page-container">
		<tiles:insertAttribute name="leftFm" />
	
		<div class="main-content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	
	<div class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/dropzone/css/dropzone.css">
	
	<!-- Bottom Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/TweenMax.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/resizeable.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/joinable.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/xenon-api.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/xenon-toggles.js"></script>
	
	<!-- Imported scripts on this page -->
	<script src="${pageContext.request.contextPath}/assets/js/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datatables/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-validate/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datepicker/locales/bootstrap-datepicker.kr.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/select2/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/toastr/toastr.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/inputmask/jquery.inputmask.bundle.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-form/jquery.form.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/dropzone/dropzone.min.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="${pageContext.request.contextPath}/assets/js/xenon-custom.js" id="xenon-custom"></script>
	<script src="${pageContext.request.contextPath}/assets/js/custom/speed-custom.js"></script>

</body>
</html>