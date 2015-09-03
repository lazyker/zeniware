<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="currentUser" property="principal" />
 
<div class="sidebar-menu toggle-others"> 
		 
	<div class="sidebar-menu-inner">

		<ul id="main-menu" class="main-menu auto-inherit-active-class">
			
			<li>
				<a href="${pageContext.request.contextPath}/admin/workflow/basicInit">
					<i class="linecons-tag"></i><span class="title">기본설정</span>
				</a>
			</li>

			<li>
				<a href="${pageContext.request.contextPath}/admin/workflow/formMaker">
					<i class="linecons-tag"></i><span class="title">양식관리</span>
				</a>
			</li>
			
			<li>
				<a href="#">
					<i class="linecons-tag"></i><span class="title">부서문서함관리</span>
				</a>
			</li>
			
			<li>
				<a href="#">
					<i class="linecons-tag"></i><span class="title">문서이동</span>
				</a>
			</li>
			
		</ul> 
		 
	</div> 
</div> 

<script type="text/javascript">

	$(document).ready(function() {
		
	});
	
/* ***References***

*/

</script>