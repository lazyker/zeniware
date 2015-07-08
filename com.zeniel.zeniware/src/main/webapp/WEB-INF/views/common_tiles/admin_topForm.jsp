<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar horizontal-menu navbar-fixed-top navbar-minimal"><!-- set fixed position by adding class "navbar-fixed-top" -->
		
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
				<a href="${pageContext.request.contextPath}/admin/preference/commonCodeMain">
					<i class="linecons-cog"></i>
					<span class="title">환경설정</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="linecons-note"></i>
					<span class="title">게시판</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="linecons-calendar"></i>
					<span class="title">일정관리</span>
				</a>
			<li>
				<a href="#">
					<i class="linecons-desktop"></i>
					<span class="title">업무관리</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/admin/community/default">
					<i class="linecons-user"></i>
					<span class="title">커뮤니티</span>
				</a>
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/admin/community/default">
						<i class="linecons-diamond"></i>
						<span class="title">기본설정</span>
						</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="#">
					<i class="linecons-shop"></i>
					<span class="title">자원예약</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="linecons-doc"></i>
					<span class="title">전자결재</span>
				</a>
			</li>
		</ul>
	</div>

</nav>