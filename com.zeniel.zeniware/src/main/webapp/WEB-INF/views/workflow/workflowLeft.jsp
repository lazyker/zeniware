<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="currentUser" property="principal" />
 
<div class="sidebar-menu"> 
		 
	<div class="sidebar-menu-inner">
	
		<div class="panel panel-flat-custom">
			<div class="panel-body">
				<div class="vertical-top">
					<button class="btn btn-secondary btn-icon btn-icon-standalone btn-icon-standalone-right btn-block">
						<i class="fa-pencil"></i>
						<span>새 문서</span>
					</button>
				</div>
			</div>
		</div>

		<ul id="main-menu" class="main-menu">
			
			<li>
				<a href="#"> 
					<i class="linecons-desktop"></i><span class="title">개인결재</span>
				</a>
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/workflow/flow/flow1">
							<i class="entypo-flow-line"></i><span class="title">대기문서</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/workflow/flow/flow2">
							<i class="entype-flow-line"></i><span class="title">진행문서</span>
						</a>
					</li>
				</ul>
			</li> 
			
			<li>
				<a href="#">
					<i class="linecons-database"></i><span class="title">부서결재</span>
				</a>
				<ul>
					<li>
						<a href="#">
							<i class="entypo-flow-line"></i><span class="title">미처리문서함</span>
						</a>
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/workflow/flow/flow3">
									<i class="entype-flow-parallel"></i><span class="title">일반기안문</span>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="entype-flow-parallel"></i><span class="title">휴가신청서</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</li>
			
			<li> 
				<a href="#"> 
					<i class="linecons-desktop"></i><span class="title">개인문서함</span>
				</a>
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/workflow/folder/folder1">
							<i class="entypo-flow-line"></i><span class="title">기안문서함</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="entype-flow-line"></i><span class="title">결재문서함</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="entype-flow-line"></i><span class="title">참조문서함</span>
						</a>
					</li>
				</ul>
			</li>
			
			<li> 
				<a href="#"> 
					<i class="linecons-database"></i><span class="title">부서문서함</span>
				</a>
				<ul>
					<li>
						<a href="#">
							<i class="entype-flow-line"></i><span class="title">솔루션사업팀</span>
						</a>
						<ul>
							<li>
								<a href="#">
									<i class="entype-flow-parallel"></i><span class="title">품의함</span>
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/workflow/folder/folder2">
									<i class="entype-flow-parallel"></i><span class="title">수신함</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
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