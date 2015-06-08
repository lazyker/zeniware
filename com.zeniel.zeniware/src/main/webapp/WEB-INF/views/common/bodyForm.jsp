<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>메인 페이지</title>
	
	<!-- 기본 설정 JS Form -->
	<%@ include file="jsForm.jsp" %>
</head>
<body class="page-body horizontal-menu-skin-navy">

	<%@ include file="topForm.jsp" %>

	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="main-content">
					
			<div class="jumbotron">
				<h1>메인화면</h1>
			</div>
			<a href="/zeniware/test2">서브화면</a><br/>
			<a href="/zeniware/test3">메인 예외화면</a><br/>
			<a href="/zeniware/test4">서브 left와 body 명 같은 파일명화면(left_sub_test.jsp,sub_test.jsp)</a><br/>
			<a href="/zeniware/test5">서브 left랑 body 다른 파일명 화면(sub_order.jsp , sub_test.jsp)</a><br/>
					
		<%@ include file="footerForm.jsp" %>
		
		</div>
	</div>
	
</body>
</html>