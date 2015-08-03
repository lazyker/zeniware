<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import = "javax.servlet.ServletException" %>
<%@ page isErrorPage = "true" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<title>ERROR</title>

	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
	<link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/xenon-core.css">
	<link rel="stylesheet" href="assets/css/xenon-forms.css">
	<link rel="stylesheet" href="assets/css/xenon-components.css">
	<link rel="stylesheet" href="assets/css/xenon-skins.css">
	<link rel="stylesheet" href="assets/css/custom.css">

</head>
<body class="page-body page-error-env">

	<div class="page-error centered">
		
		<div class="error-symbol">
			<i class="fa-warning"></i>
		</div>
		
		<h2>
			Error 500
			<small>Error Messages</small>
		</h2>
		
<!-- 		<p>We did not find the page you were looking for!</p> -->
<!-- 		<p>You can search again or contact one of our agents to help you!</p> -->
		<p><%= exception.getMessage()%></p>
		<p><%
			    Throwable rootCause = null;
			    if (exception instanceof ServletException) {
			        rootCause = ((ServletException)exception).getRootCause();
			    } else {
			        rootCause = exception.getCause();
			    }
			    if (rootCause != null) {
			        do {
			%>
				예외 추적: <%= rootCause.getMessage() %><br>
			<%
			            rootCause = rootCause.getCause();
			        } while(rootCause != null);
			    }
			%>
	</p>
		
	</div>
	
	<div class="page-error-search centered">
		<a href="#" class="go-back">
			<i class="fa-angle-left"></i>
			Go Back
		</a>
	</div>

</body>
</html>