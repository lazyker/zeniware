<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar horizontal-menu navbar-minimal"><!-- set fixed position by adding class "navbar-fixed-top" -->
	
	<div class="navbar-inner">
	
		<!-- Navbar Brand -->
		<div class="navbar-brand">
			<a href="dashboard-1.html" class="logo">
				<img src="${pageContext.request.contextPath}/assets/images/logo@2x.png" width="80" alt="" class="hidden-xs" />
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
				<a href="dashboard-1.html">
					<i class="linecons-cog"></i>
					<span class="title">전자우편</span>
				</a>
			</li>
			<li>
				<a href="<c:url value= '/schedule/getMonth'/>">
					<i class="linecons-desktop"></i>
					<span class="title">일정관리</span>
				</a>
			</li>
			<li>
				<a href="ui-panels.html">
					<i class="linecons-note"></i>
					<span class="title">전자결재</span>
				</a>
			</li>
			<li>
				<a href="forms-native.html">
					<i class="linecons-params"></i>
					<span class="title">업무관리</span>
				</a>
			</li>
			<li>
				<a href="">
					<i class="linecons-diamond"></i>
					<span class="title">커뮤니티</span>
				</a>
			</li>
			<li>
				<a href="">
					<i class="linecons-diamond"></i>
					<span class="title">자원관리</span>
				</a>
			</li>
			<li>
				<a href="">
					<i class="linecons-diamond"></i>
					<span class="title">문서관리</span>
				</a>
			</li>
			<li>
				<a href="">
					<i class="linecons-diamond"></i>
					<span class="title">주소록</span>
				</a>
			</li>
		</ul>
				
		
		<!-- notifications and other links -->
		<ul class="nav nav-userinfo navbar-right">
			
			<li class="dropdown xs-left">
				<a href="#" data-toggle="dropdown" class="notification-icon notification-icon-messages">
					<i class="fa-bell-o"></i>
					<span class="badge badge-purple">7</span>
				</a>
			</li>
	
			<li class="dropdown user-profile">
				<a href="#" data-toggle="dropdown">
					<img src="${pageContext.request.contextPath}/resources/images/main/photo.png" alt="user-image" class="img-circle img-inline userpic-32" width="35" />
				</a>
			</li>
			
			<li>
				<a href="#">
					<i class="fa fa-bar-chart"></i>
				</a>
			</li>
			
			<li>
				<a href="#">
					<i class="fa fa-cog"></i>
				</a>
			</li>
			
			<li>
				<a href="#">
					<i class="fa fa-sign-out"></i>
				</a>
			</li>
		</ul>

	</div>
	
</nav>