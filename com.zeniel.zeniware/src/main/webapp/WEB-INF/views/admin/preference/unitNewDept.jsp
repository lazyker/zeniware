<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label for="txtDeptId" class="control-label">상위부서ID</label>
			<input type="text" class="form-control" id="txtDeptId" value="${dept.parentDeptId}" />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label for="txtDeptName" class="control-label">상위부서명</label>
			<input type="text" class="form-control" id="txtDeptName" value="${dept.parentDeptName }" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label for="txtDeptId" class="control-label">부서ID</label>
			<input type="text" class="form-control" id="txtDeptId" value="${dept.deptId}" />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label for="txtDeptName" class="control-label">부서명</label>
			<input type="text" class="form-control" id="txtDeptName" value="${dept.deptName}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label for="txtDeptId" class="control-label">부서명 약어</label>
			<input type="text" class="form-control" id="txtDeptId" value="${dept.simpleName}" />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label for="txtDeptName" class="control-label">부서메일ID</label>
			<input type="text" class="form-control" id="txtDeptName" value="${dept.mailId}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="form-group no-margin">
			<label for="sboxUser" class="control-label">부서장</label>
			<select class="form-control" id="sboxUser">
				<option></option>
				<option value="1">홍길동 사원</option>
			</select>
		</div>
	</div>
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		$('select').select2({
			placeholder: "선택하세요...", 
			allowClear: true
		}).on('select2-open', function() {
			$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
		});
		
	});
	
</script>
