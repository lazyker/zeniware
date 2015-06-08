<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>그룹웨어</title>
<tiles:insertAttribute name="jsFm" />
</head>
<body class="page-body horizontal-menu-skin-navy">
<tiles:insertAttribute name="top" />
<div class="page-container">
	<div class="main-content">
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
</div>
</body>
</html>