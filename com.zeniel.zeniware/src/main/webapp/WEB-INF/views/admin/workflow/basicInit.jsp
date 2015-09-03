<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">전자결재 기본설정</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="../workflow/basicInit">전자결재</a></li>
			<li class="active">기본설정</strong></li>
		</ol>
	</div>
	
</div>

<form role="form">

	<div class="row">
	
		<div class="col-md-6">
		
			<div class="panel panel-default panel-border panel-shadow">	
				
				<div class="panel-heading">
					<h3 class="panel-title">결재서명</h3>
				</div>
				
				<div class="panel-body">
					<p>
						<label class="radio-inline">
							<input type="radio" class="cbr cbr-primary" name="signYn" 
								value="true" <c:if test="${conf.signYn}">checked</c:if> />결재서명 사용함
						</label>
						<label class="radio-inline">
							<input type="radio" class="cbr cbr-primary" name="signYn" 
								value="false" <c:if test="${!conf.signYn}">checked</c:if> />결재서명 사용하지 않음
						</label>
					</p>
				</div>
				
			</div>
			
		</div>
		
		<div class="col-md-6">
		
			<div class="panel panel-default panel-border panel-shadow">
				
				<div class="panel-heading">
					<h3 class="panel-title">결재암호</h3>
				</div>
				
				<div class="panel-body">
					<p>
						<label class="radio-inline">
							<input type="radio" class="cbr cbr-primary" name="passYn" 
								value="true" <c:if test="${conf.passYn}">checked</c:if> />결재암호 사용함
						</label>
						<label class="radio-inline">
							<input type="radio" class="cbr cbr-primary" name="passYn" 
								value="false <c:if test="${!conf.passYn}">checked</c:if>" />결재암호 사용하지 않음
						</label>
					</p>
				</div>
				
			</div>
			
		</div>
		
		<div class="col-md-6">
		
			<div class="panel panel-default panel-border panel-shadow">
				
				<div class="panel-heading">
					<h3 class="panel-title">직위/직책</h3>
				</div>
				
				<div class="panel-body">
					<p>
						<label class="radio-inline">
							<input type="radio" class="cbr cbr-primary" name="titleYn" 
								value="true" <c:if test="${conf.titleYn}">checked</c:if> />결재칸 직위 사용
						</label>
						<label class="radio-inline">
							<input type="radio" class="cbr cbr-primary" name="titleYn" 
								value="false" <c:if test="${!conf.titleYn}">checked</c:if> />결재칸 직책 사용
						</label>
					</p>
				</div>
				
			</div>
			
		</div>
		
		<div class="col-md-6">
		
			<div class="panel panel-default panel-border panel-shadow">
				
				<div class="panel-heading">
					<h3 class="panel-title">합의결재</h3>
				</div>
				
				<div class="panel-body">
					<p>
						<label class="radio-inline">
							<input type="radio" class="cbr cbr-primary" name="agreementYn" 
								value="true" <c:if test="${conf.agreementYn}">checked</c:if> />반대 시 결재 진행
						</label>
						<label class="radio-inline">
							<input type="radio" class="cbr cbr-primary" name="agreementYn" 
								value="false" <c:if test="${!conf.agreementYn}">checked</c:if> />반대 시 결재 중단
						</label>
					</p>
				</div>
				
			</div>
			
		</div>
		
		<div class="col-md-12">
		
			<div class="panel panel-default panel-border panel-shadow">
				
				<div class="panel-heading">
					<h3 class="panel-title">문서번호 생성규칙</h3>
				</div>
				
				<div class="panel-body">
					
					<div class="row">
						<div class="col-sm-4">
							<strong>접두어</strong>
							<br />
							<div class="form-block">
								<label>
									<input type="radio" class="cbr cbr-primary" name="namingPrefix" 
										value="d" <c:if test="${conf.namingPrefix.equals('d')}">checked</c:if> />부서명(Simple Name)
								</label>
								<br />
								<label>
									<input type="radio" class="cbr cbr-primary" name="namingPrefix" 
										value="c" <c:if test="${conf.namingPrefix.equals('c')}">checked</c:if> />회사명(Simple Name)
								</label>
							</div>
						</div>
						
						<div class="col-sm-4">
							<strong>연도표기</strong>
							<br />
							<div class="form-block">
								<label>
									<input type="radio" class="cbr cbr-primary" name="namingYear" 
										value="2" <c:if test="${conf.namingYear == 2}">checked</c:if> />2자리
								</label>
								<br />
								<label>
									<input type="radio" class="cbr cbr-primary" name="namingYear" 
										value="4" <c:if test="${conf.namingYear == 4}">checked</c:if> />4자리
								</label>
							</div>
						</div>
						
						<div class="col-sm-4">
							<strong>자릿수</strong>
							<br />
							<div class="form-block">
								<label>
									<input type="radio" class="cbr cbr-primary" name="namingDigit" 
										value="3" <c:if test="${conf.namingDigit == 3}">checked</c:if> />000
								</label>
								<br />
								<label>
									<input type="radio" class="cbr cbr-primary" name="namingDigit" 
										value="5" <c:if test="${conf.namingDigit == 5}">checked</c:if> />00000
								</label>
							</div>
						</div>
						
					</div>
					
				</div>				
					
				<input type="hidden" name="compId" value="${conf.compId}" />
	
			</div>
			
		</div>
		
		<div class="col-sm-12">
			<div class="pull-right">
				<button type="button" class="btn btn-info" id="btnSave">저장</button>
				<button type="reset" class="btn btn-white" id="btnCancel">취소</button>
			</div>
		</div>
		
	</div>

</form>

<script type="text/javascript">

	$(document).ready(function() {

		$('#btnSave').on('click', function() {
			bootbox.confirm('저장하시겠습니까?', function(result) {
				if (result) {
					$.ajax({
						dataType: "json", 
						type: "post", 
						url: './ajax/setSingleConf', 
						data: {
							conf: createNameElements()
						}, 
						success: function(data) {
							toastrAlert('success', '저장되었습니다.');
							$(location).prop('href', './basicInit');
						} 
					});
				}
			});
		});
		
		$('#btnCancel').on('click', function() {
			$(location).prop('href', './basicInit');
		});
		
	});

/* ***References***

*/

</script>