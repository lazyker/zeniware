<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Insert title here</title>
	
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script>
	document.oncontextmenu = document.body.oncontextmenu = function() {return false;}
	</script>
</head>
<body oncontextmenu="return false" >
	<form action="upload" method="post" enctype="multipart/form-data">
		<fieldset>
			<table>
<!-- 				<tr> -->
<!-- 					<th>이름</th> -->
<!-- 					<td><input type="text" name="name" required="required" placeholder="이름"></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>비밀번호</th> -->
<!-- 					<td><input type="password" name="pwd" required="required" placeholder="비밀번호"></td> -->
<!-- 				</tr> -->
				<tr>
					<th>파일</th>
					<td><input type="file" name="file"></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th>제목</th> -->
<!-- 					<td><input type="text" name="title" required="required" placeholder="제목"></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>내용</th> -->
<!-- 					<td><textarea rows="20" cols="40" name="content" required="required" placeholder="내용"></textarea></td> -->
<!-- 				</tr> -->
				<tr>
					<td colspan="2">
						<input type="submit" value="작성">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</fieldset>
		
	</form>
</body>
</html>