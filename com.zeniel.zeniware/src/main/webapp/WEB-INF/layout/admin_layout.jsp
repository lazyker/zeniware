<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
	<tiles:insertAttribute name="header" />
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/datatables/dataTables.bootstrap.css">
	
	<!-- JavaScripts initializations and stuff -->
	<script src="${pageContext.request.contextPath}/assets/js/xenon-custom.js"></script>
	
<body class="page-body skin-aero">
	
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
	<script src="${pageContext.request.contextPath}/assets/js/datatables/js/jquery.dataTables.min.js"></script>

	<!-- Imported scripts on this page -->
	<script src="${pageContext.request.contextPath}/assets/js/datatables/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
	
<%-- 	<script src="${pageContext.request.contextPath}/assets/js/datatables_origin/media/js/jquery.dataTables.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/assets/js/datatables_origin/extensions/TableTools/js/dataTables.tableTools.js"></script> --%>

</body>
</html>