<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="zeniware.common.login.MemberInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	
	Object principal = auth.getPrincipal();
	String name = "";
	
	if(principal != null && principal instanceof MemberInfo){
		name = ((MemberInfo)principal).getName();
	}
%>

<html>
<head>
	<title>그룹웨어</title>
</head>
<body>
	<div id="wrapper">
		<sec:authorize access="isAnonymous()">
		<form id="loginfrm" name="loginfrm" method="POST" action="${ctx}/j_spring_security_check">
		<table>
			<tr>
				<td style="width:50px;">id</td>
				<td style="width:150px;">
                	<input style="width:145px;" type="text" id="loginid" name="loginid" value="" />
            	</td>
			</tr>
			<tr>
				<td>pwd</td>
				<td>
                	<input style="width:145px;" type="text" id="loginpwd" name="loginpwd" value="" />
	           	 </td>
			</tr>
			<tr>
				<td colspan="2">
                	<input type="submit" id="loginbtn" value="로그인" />
	            </td>
			</tr>
		</table>
		</form>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
		<c:out value="<%=name%>" /> 님 반갑습니다
		
		<a href="${ctx}/j_spring_security_logout">로그아웃</a>
		</sec:authorize>
		<ul>
			<sec:authorize access="hasRole('admin')">
			<li>관리자 화면</li>
			</sec:authorize>
			<sec:authorize access="permitAll">
			<li>비회원 게시판</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			<li>준회원 게시판</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('user')">
			<li>정회원 게시판</li>
			</sec:authorize>
		</ul>
	</div>
<%-- ${username}님 반갑습니다. <a href="j_spring_security_logout">로그아웃</a> --%>
</body>
</html>