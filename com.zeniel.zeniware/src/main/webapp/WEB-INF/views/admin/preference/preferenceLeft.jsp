<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
 
<div class="sidebar-menu toggle-others fixed"> 
		 
	<div class="sidebar-menu-inner"> 
 
		<ul id="main-menu" class="main-menu"> 
			
			<li> 
				<a href="${pageContext.request.contextPath}/admin/preference/codeMain"> 
					<i class="linecons-tag"></i><span class="title">공통코드관리</span> 
					 
				</a> 
			</li> 
			
			<li>
				<a href="${pageContext.request.contextPath}/admin/preference/unitSelect">
					<i class="linecons-user"></i><span class="title">조직관리</span>
				</a>
			</li>
			
			<li>
				<a href="#">
					<i class="linecons-key"></i><span class="title">권한관리</span>
				</a>
			</li>
			
		</ul> 
		 
	</div> 
</div> 
