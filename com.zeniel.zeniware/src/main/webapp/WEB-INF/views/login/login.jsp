<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="zeniware.common.login.MemberInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//Spring Security
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	
	Object principal = auth.getPrincipal();
	String name = "";
	
	if(principal != null && principal instanceof MemberInfo){
		name = ((MemberInfo)principal).getName();
	}
	
	//HttpServletRequest
	Authentication auth2 = (Authentication)request.getUserPrincipal();
	String name2 = "";
	if(auth2 == null){

	}else{
		Object principal2 = auth.getPrincipal();
		if(principal2 != null && principal2 instanceof MemberInfo){
			name2 = ((MemberInfo)principal2).getName();
		}
	}
%>


<!DOCTYPE html>
<html>
<head>
	<title>login</title>
	<script>
		function doLogin() {
			
			frm.submit();
		}
	</script>
</head>
<body>
<form name="frm" action="j_spring_security_check" method="POST">

<table>
<tr>
	<td> 아이디</td>
	<td> <input type="text" name="loginid"> </td>
</tr>
<tr>
	<td> 패스워드</td>
	<td> <input type="text"  name="loginpwd"> </td>
</tr>
<tr>
	<td colspan="2" align="center"><input type="button" value="로그인" onclick="doLogin()"></td>
</tr>
</table>
</form>


</body>
</html>
