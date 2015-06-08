<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="sidebar-menu toggle-others">
		
	<div class="sidebar-menu-inner">
	
		<header class="logo-env">
			
				<!-- logo -->
				<div class="logo">
					<a href="dashboard-1.html" class="logo-expanded">
						<img src="${pageContext.request.contextPath}/assets/images/logo@2x.png" width="80" alt="" />
					</a>
	
					<a href="dashboard-1.html" class="logo-collapsed">
						<img src="${pageContext.request.contextPath}/assets/images/logo-collapsed@2x.png" width="40" alt="" />
					</a>
				</div>
	
				<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
				<div class="mobile-menu-toggle visible-xs">
					<a href="#" data-toggle="user-info-menu">
						<i class="fa-bell-o"></i>
						<span class="badge badge-success">7</span>
					</a>
	
					<a href="#" data-toggle="mobile-menu">
						<i class="fa-bars"></i>
					</a>
				</div>
	
				<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
				<div class="settings-icon">
					<a href="#" data-toggle="settings-pane" data-animate="true">
						<i class="linecons-cog"></i>
					</a>
				</div>
			
		</header>

	</div>
		
</div>