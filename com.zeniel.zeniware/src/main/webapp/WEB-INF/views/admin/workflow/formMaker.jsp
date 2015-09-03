<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">전자결재 양식관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="../workflow/basicInit">전자결재</a></li>
			<li class="active">양식관리</strong></li>
		</ol>
	</div>
	
</div>


<div class="row">

	<div class="col-md-12">
	
		<div class="pull-right">
			<button class="btn btn-danger btn-icon btn-icon-standalone btn-icon-standalone-right" id="btnFormAdd">
				<i class="fa-pencil"></i>
				<span>양식 추가</span>
			</button>
		</div>
		
	</div>
	
</div>

<div class="row">

	<div class="col-md-12">

		<div class="panel-group" id="accordion-test-2">
							
			<div class="panel panel-default panel-border panel-shadow">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseOne-2">
							일반
						</a>
					</h4>
				</div>
				<div id="collapseOne-2" class="panel-collapse collapse">
				
					<div class="panel-body">
						<div class="list-group list-group-minimal"><!-- Add class "list-group-minimal" for less padding between list items -->
							<a href="./formNew" class="list-group-item">
								<span class="badge badge-danger">영구보존</span>
								일반기안문
							</a>
							<a href="./formNew" class="list-group-item">
								<span class="badge badge-success">3 년</span>
								휴가신청서
							</a>
							<a href="./formNew" class="list-group-item">
								<span class="badge badge-success">3 년</span>
								휴직신청서
							</a>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="panel panel-default panel-border panel-shadow">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseTwo-2" class="collapsed">
							인사/복지
						</a>
					</h4>
				</div>
				<div id="collapseTwo-2" class="panel-collapse collapse">
				
					<div class="panel-body">
						<div class="list-group list-group-minimal"><!-- Add class "list-group-minimal" for less padding between list items -->
							<a href="#" class="list-group-item">
								<span class="badge badge-warning">5 년</span>
								출장신청서
							</a>
							<a href="#" class="list-group-item">
								<span class="badge badge-warning">5 년</span>
								출장복명서
							</a>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="panel panel-default panel-border panel-shadow">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseThree-2" class="collapsed">
							기타
						</a>
					</h4>
				</div>
				<div id="collapseThree-2" class="panel-collapse collapse">
				
					<div class="panel-body">
						<div class="list-group list-group-minimal"><!-- Add class "list-group-minimal" for less padding between list items -->
							<a href="#" class="list-group-item">
								<span class="badge badge-primary">1 년</span>
								경조사지원신청서
							</a>
							<a href="#" class="list-group-item">
								<span class="badge badge-info">3 년</span>
								근로소득증명서발급신청서
							</a>
							<a href="#" class="list-group-item">
								<span class="badge badge-danger">영구보존</span>
								단체가입신청서
							</a>
							<a href="#" class="list-group-item">
								<span class="badge badge-success">5 년</span>
								서면결의서
							</a>
							<a href="#" class="list-group-item">
								<span class="badge badge-warning">10 년</span>
								외부소유물품반입신청서
							</a>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
	</div>
	
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		$('#btnFormAdd').on('click', function() {
			$(location).prop('href', './formNew');
		});
		
	});

/* ***References***

*/

</script>