<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>그룹웨어</title>
	
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/xenon-core.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/xenon-forms.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/xenon-components.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/xenon-skins.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>
	
</head>

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

	<!-- Imported scripts on this page -->

	<!-- JavaScripts initializations and stuff -->
	<script src="${pageContext.request.contextPath}/assets/js/xenon-custom.js"></script>

</body>
</html>