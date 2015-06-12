<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="zeniware.common.login.MemberInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//Spring Security
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	
	Object principal = auth.getPrincipal();
	String name = "";
	
	if(principal != null && principal instanceof MemberInfo){
		name = ((MemberInfo)principal).getName();
	}
	
	//HttpServletRequest
	Authentication auth2 = (Authentication)request.getUserPrincipal();
	String name2 = "";
	if(auth2 == null){

	}else{
		Object principal2 = auth.getPrincipal();
		if(principal2 != null && principal2 instanceof MemberInfo){
			name2 = ((MemberInfo)principal2).getName();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="User Login Panel" />
	
	<title>login</title>
	
	<link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/xenon-core.css">
	<link rel="stylesheet" href="assets/css/xenon-forms.css">
	<link rel="stylesheet" href="assets/css/xenon-components.css">
	<link rel="stylesheet" href="assets/css/xenon-skins.css">
	
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script>
			jQuery(document).ready(function($)
			{
				// Reveal Login form
				setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);


				// Validation and Ajax action
				$("form#login").validate({
					rules: {
						loginid: {
							required: true
						},

						loginpwd: {
							required: true
						}
					},

					messages: {
						loginid: {
							required: 'ID를 입력하세요.'
						},

						loginpwd: {
							required: '패스워드를 입력하세요.'
						}
					},

					// Form Processing via AJAX
					submitHandler: function(form)
					{
						show_loading_bar(70); // Fill progress bar to 70% (just a given value)

						var opts = {
							"closeButton": true,
							"debug": false,
							"positionClass": "toast-top-full-width",
							"onclick": null,
							"showDuration": "300",
							"hideDuration": "1000",
							"timeOut": "5000",
							"extendedTimeOut": "1000",
							"showEasing": "swing",
							"hideEasing": "linear",
							"showMethod": "fadeIn",
							"hideMethod": "fadeOut"
						};
						
						$.ajax({
							url: "j_spring_security_check",
							method: 'POST',
							dataType: 'json',
							data: {
								loginid: $(form).find('#loginid').val(),
								loginpwd: $(form).find('#loginpwd').val(),
							},
							success: function(resp)
							{
								show_loading_bar({
									delay: .5,
									pct: 100,
									finish: function(){

										// Redirect after successful login page (when progress bar reaches 100%)
										if(resp.accessGranted)
										{
											window.location.href = '${pageContext.request.contextPath}/main';
										}
									}
								});

								
								// Remove any alert
								$(".errors-container .alert").slideUp('fast');


								// Show errors
								if(resp.accessGranted == false)
								{
									$(".errors-container").html('<div class="alert alert-danger">\
										<button type="button" class="close" data-dismiss="alert">\
											<span aria-hidden="true">&times;</span>\
											<span class="sr-only">Close</span>\
										</button>\
										' + resp.errors + '\
									</div>');


									$(".errors-container .alert").hide().slideDown();
									$(form).find('#passwd').select();
								}
							},
							error : function(request) {
								alert("로그인 오류 발생 [관리자에게 문의 하세요.]");
							}
						});

					}
				});

				// Set Form focus
				$("form#login .form-group:has(.form-control):first .form-control").focus();
			});
			
		</script>
</head>
<body class="page-body login-page login-light">

	<div class="login-container">
	
		<div class="row">
	
			<div class="col-sm-6">
	
				<!-- Errors container -->
				<div class="errors-container">
				
				</div>
	
				<!-- Add class "fade-in-effect" for login form effect -->
				<form method="post" role="form" name="form" id="login" class="login-form fade-in-effect">
	
					<div class="login-header">
						<a href="dashboard-1.html" class="logo">
							<img src="assets/images/logo-white-bg@2x.png" alt="" width="80" />
							<span>log in</span>
						</a>
					</div>
	
	
					<div class="form-group">
						<label class="control-label" for="username">Username</label>
						<input type="text" class="form-control" name="loginid" id="loginid" autocomplete="off" value="" />
					</div>
	
					<div class="form-group">
						<label class="control-label" for="passwd">Password</label>
						<input type="password" class="form-control" name="loginpwd" id="loginpwd" autocomplete="off" value="" />
					</div>
	
					<div class="form-group">
						<button type="submit" class="btn btn-primary  btn-block text-left">
							<i class="fa-lock"></i>
							Log In
						</button>
					</div>
					
					<div class="login-footer">
						<div class="info-links">
							<span>Copyright(c) ZENIEL. All Rights Reserved.</span>
						</div>
	
					</div>
				</form>
	
			</div>
		</div>
	</div>

	<!-- Bottom Scripts -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/TweenMax.min.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/xenon-api.js"></script>
	<script src="assets/js/xenon-toggles.js"></script>
	<script src="assets/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="assets/js/toastr/toastr.min.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
