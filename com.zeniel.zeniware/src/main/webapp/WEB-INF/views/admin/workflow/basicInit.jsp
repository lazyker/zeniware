<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">전자결재 기본설정</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="../workflow/basicInitialisation">전자결재</a></li>
			<li class="active">기본설정</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">

	<div class="col-md-12">
	
		<div class="panel panel-default panel-border panel-shadow">	
			
			<div class="panel-heading">
				<h3 class="panel-title">결재서명</h3>
			</div>
			
			<div class="panel-body">
				<p>
					<label class="radio-inline"><input type="radio" class="cbr cbr-primary" name="radio-1" checked>결재서명 사용함</label>
					<label class="radio-inline"><input type="radio" class="cbr cbr-primary" name="radio-1">결재서명 사용하지 않음</label>
				</p>
			</div>
			
		</div>
		
	</div>
	
	<div class="col-md-12">
	
		<div class="panel panel-default panel-border panel-shadow">
			
			<div class="panel-heading">
				<h3 class="panel-title">결재암호</h3>
			</div>
			
			<div class="panel-body">
				<p>
					<label class="radio-inline"><input type="radio" class="cbr cbr-primary" name="radio-2" checked>결재암호 사용함</label>
					<label class="radio-inline"><input type="radio" class="cbr cbr-primary" name="radio-2">결재암호 사용하지 않음</label>
				</p>
			</div>
			
		</div>
		
	</div>
	
	<div class="col-md-12">
	
		<div class="panel panel-default panel-border panel-shadow">
			
			<div class="panel-heading">
				<h3 class="panel-title">직위/직책</h3>
			</div>
			
			<div class="panel-body">
				<p>
					<label class="radio-inline"><input type="radio" class="cbr cbr-primary" name="radio-3" checked>결재칸 직위 사용</label>
					<label class="radio-inline"><input type="radio" class="cbr cbr-primary" name="radio-3">결재칸 직책 사용</label>
				</p>
			</div>
			
		</div>
		
	</div>
	
	<div class="col-md-12">
	
		<div class="panel panel-default panel-border panel-shadow">
			
			<div class="panel-heading">
				<h3 class="panel-title">합의결재</h3>
			</div>
			
			<div class="panel-body">
				<p>
					<label class="radio-inline"><input type="radio" class="cbr cbr-primary" name="radio-4" checked>반대 시 결재 진행</label>
					<label class="radio-inline"><input type="radio" class="cbr cbr-primary" name="radio-4">반대 시 결재 중단</label>
				</p>
			</div>
			
		</div>
		
	</div>
	
	<div class="col-sm-12">
		<div class="pull-right">
			<button type="submit" class="btn btn-info" id="btnSave">저장</button>
			<button type="reset" class="btn btn-white" data-dismiss="modal">취소</button>
		</div>
	</div>
	
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		var contextPath = "${pageContext.request.contextPath}";
				
	});

/* ***References***

*/

</script>