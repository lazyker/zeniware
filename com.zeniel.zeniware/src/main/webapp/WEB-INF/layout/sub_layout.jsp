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
	
	<tiles:insertAttribute name="jsFm" />
</head>

<body class="page-body horizontal-menu-skin-navy">
	<tiles:insertAttribute name="top" />

	<div class="page-container">
		<tiles:insertAttribute name="leftFm" />
		
		<div class="main-content">
			<tiles:insertAttribute name="body" />
<%-- 			<tiles:insertAttribute name="footer" /> --%>
		</div>
	</div>
</body>
</html>