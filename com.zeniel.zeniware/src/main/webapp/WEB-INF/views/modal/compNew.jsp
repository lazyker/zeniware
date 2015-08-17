<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-md-12">
		<div class="form-group">
			<input type="checkbox" class="iswitch iswitch-secondary" name="activateYn" checked="${comp.activateYn}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="form-group">
			<label for="txtCompId" class="control-label">회사ID</label>
			<input type="text" class="form-control" id="txtCompId" value="${comp.compId}" readonly />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="form-group">
			<label for="txtCompName" class="control-label">회사명</label>
			<input type="text" class="form-control" id="txtCompName" value="${comp.compName}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="form-group">
			<label for="txtDesc" class="control-label" for="description">상세설명</label>
			<textarea class="form-control" cols="2" name="description">${comp.description}</textarea>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom/preference.js"></script>