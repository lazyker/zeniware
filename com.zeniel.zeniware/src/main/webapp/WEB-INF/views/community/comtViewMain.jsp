<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title">
	<div class="title-env">
		<h1 class="title">커뮤니티</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="${pageContext.request.contextPath}/"><i class="fa-home"></i>Home</a></li>
			<li><a href="./comtMain">Community</a></li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">
		<div class="panel-body">
			<div class="col-sm-6">
				<ul class="nav nav-tabs nav-tabs-justified">
					<li class="active">
						<a href="#comtInfoEd" data-toggle="tab">
							<span class="visible-xs"><i class="fa-home"></i></span>
							<span class="hidden-xs">커뮤니티 정보 수정</span>
						</a>
					</li>
					<li>
						<a href="#comtAddUserIf" data-toggle="tab">
							<span class="visible-xs"><i class="fa-home"></i></span>
							<span class="hidden-xs">가입멤버</span>
						</a>
					</li>
					<li>
						<a href="#comtCloseIf" data-toggle="tab">
							<span class="visible-xs"><i class="fa-home"></i></span>
							<span class="hidden-xs">커뮤니티페쇄</span>
						</a>
					</li>
					<li>
						<a href="#comtSendIf" data-toggle="tab">
							<span class="visible-xs"><i class="fa-home"></i></span>
							<span class="hidden-xs">알림</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>