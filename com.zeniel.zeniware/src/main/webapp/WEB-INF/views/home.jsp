<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="zeniware.sample.vo.Employee" %>

<html>
<head>
	<title>Home</title>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript">
	  $(document).ready(function() {
	    ob1 = $.parseJSON('${toJson}');
	    
	    alert(ob1.first_name);
	  });
  </script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<br>
<P>${today}</P>
<%
// Employee s = (Employee)request.getAttribute("vo");
// s.getFirst_name();
%>
<%-- <P><%=s.getFirst_name();%></P> --%>

<p><c:out value="${toJson}" /></p>
<%-- <p>${vo.FirstName}</p> --%>


<%-- <c:forEach items="${vo}" begin="0" step="1" var="outVo"> --%>
<%--     <p><c:out value="${outVo.first_name}" /></p> --%>
<%--  </c:forEach> --%>

</body>
</html>
