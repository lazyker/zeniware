<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="currentUser" property="principal" />
 
<div class="sidebar-menu toggle-others"> 
		 
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
				<c:if test='${currentUser.entitlement.equals("2")}'>
				<ul>
					<li>
						<a href="./unitMain?compId=${currentUser.getCompId()}">
							<i class="entypo-flow-line"></i><span class="title">부서/사용자 관리</span> 
						</a>
					</li>
					<li>
						<a href="./unitClosedDept?compId=${currentUser.getCompId()}">
							<i class="entypo-flow-line"></i><span class="title">폐쇄부서 관리</span>
						</a>
					</li>
					<li>
						<a href="./unitResignedUser?compId=${currentUser.getCompId()}">
							<i class="entypo-flow-line"></i><span class="title">퇴직자 관리</span>
						</a>
					</li>
				</ul>
				</c:if>
			</li>
			
		</ul> 
		 
	</div> 
</div> 
