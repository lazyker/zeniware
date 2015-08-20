<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form role="form" id="frmComp">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">회사 추가</h4>
	</div>

	<div class="modal-body">

		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<input type="checkbox" class="iswitch iswitch-secondary" 
						name="activateYn" <c:if test="${comp.activateYn}">checked</c:if> />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">회사ID</label>
					<input type="text" class="form-control" name="compId" value="${comp.compId}" readonly />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">회사명</label>
					<input type="text" class="form-control" name="compName" value="${comp.compName}" />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label" for="description">상세설명</label>
					<textarea class="form-control" cols="2" name="description">${comp.description}</textarea>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="modal-footer">
		<div class="form-group">
			<button type="submit" class="btn btn-info">확인</button>
			<button type="reset" class="btn btn-white" data-dismiss="modal">취소</button>
		</div>
	</div>

</form>

<script type="text/javascript">

	jQuery(document).ready(function($) {
		
		$('#frmComp').validate({
			rules: {
				compName: { required: true, maxlength: 50 }, 
				description: { maxlength: 250 }
			}, 
			submitHandler: function(form) {
	 			$.ajax({
					dataType: "json", 
					type: "post", 
					url: "${pageContext.request.contextPath}/admin/ajax/setSingleComp", 
					data: {
						comp: createNameElements()
					}, 
					success: function(data) {
						modalToggle(false);
						$('#tblComp').DataTable().ajax.reload(null, false);
					} 
				});
			}
		});

	});
	
/* ***References***
	ajax.reload(callback, resetPaging): 
		https://datatables.net/reference/api/ajax.reload()
*/

</script>
