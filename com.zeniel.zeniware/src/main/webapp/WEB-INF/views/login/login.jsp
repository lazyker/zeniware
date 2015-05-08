<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
