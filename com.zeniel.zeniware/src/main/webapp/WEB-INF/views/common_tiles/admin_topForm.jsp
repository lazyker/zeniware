<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar horizontal-menu navbar-fixed-top""><!-- set fixed position by adding class "navbar-fixed-top" -->
		
	<div class="navbar-inner">
	
		<!-- Navbar Brand -->
		<div class="navbar-brand">
			<a href="${pageContext.request.contextPath}/main" class="logo">
				<img src="${pageContext.request.contextPath}/assets/images/logo-white-bg@2x.png" width="80" alt="" class="hidden-xs" />
				<img src="${pageContext.request.contextPath}/assets/images/logo@2x.png" width="80" alt="" class="visible-xs" />
			</a>
			<a href="#" data-toggle="settings-pane" data-animate="true">
				<i class="linecons-cog"></i>
			</a>
		</div>
			
		<!-- Mobile Toggles Links -->
		<div class="nav navbar-mobile">
		
			<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
			<div class="mobile-menu-toggle">
				<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
				<a href="#" data-toggle="settings-pane" data-animate="true">
					<i class="linecons-cog"></i>
				</a>
				
				<a href="#" data-toggle="user-info-menu-horizontal">
					<i class="fa-bell-o"></i>
					<span class="badge badge-success">7</span>
				</a>
				
				<!-- data-toggle="mobile-menu-horizontal" will show horizontal menu links only -->
				<!-- data-toggle="mobile-menu" will show sidebar menu links only -->
				<!-- data-toggle="mobile-menu-both" will show sidebar and horizontal menu links -->
				<a href="#" data-toggle="mobile-menu-horizontal">
					<i class="fa-bars"></i>
				</a>
			</div>
			
		</div>
		
		<div class="navbar-mobile-clear"></div>
		
		
		
		<!-- main menu -->
		<ul class="navbar-nav">
			<li>
				<%-- <a href="<c:url value= '/schedule/getMonth'/>"> --%>
				<a href="#">
					<i class="linecons-desktop"></i>
					<span class="title">환경설정</span>
				</a>
				<ul>
					<li>
						<a href="">
							<span class="title">공통코드관리</span>
						</a>
					</li>
					<li>
						<a href="dashboard-1.html">
							<span class="title">회원관리</span>
						</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="ui-panels.html">
					<i class="linecons-note"></i>
					<span class="title">게시판관리</span>
				</a>
			</li>
			<li>
				<a href="forms-native.html">
					<i class="linecons-params"></i>
					<span class="title">업무관리</span>
				</a>
			</li>
			<li>
				<a href="/adminwr/comunity/defailt">
					<i class="linecons-diamond"></i>
					<span class="title">커뮤니티관리</span>
				</a>
				<ul>
					<li>
						<a href="forms-native.html">
						<i class="linecons-diamond"></i>
						<span class="title">기본설정</span>
						</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="">
					<i class="fa fa-plus-square"></i>
					<span class="title">자원관리</span>
				</a>
			</li>
			<li>
				<a href="">
					<i class="fa fa-file-excel-o"></i>
					<span class="title">전자결재관리</span>
				</a>
			</li>
		</ul>
	</div>

</nav>