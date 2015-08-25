<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form role="form" id="frmDept">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">부서 추가</h4>
	</div>
					
	<div class="modal-body">
	
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<input type="checkbox" class="iswitch iswitch-secondary" 
						name="activateYn" <c:if test="${dept.activateYn}">checked</c:if> />
				</div>
			</div>
			
		</div>
	
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">상위부서ID</label>
					<input type="text" class="form-control" name="parentDeptId" value="${dept.parentDeptId}" readonly />
					<input type="hidden" name="compId" value="${dept.compId}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">상위부서명</label>
					<input type="text" class="form-control" name="parentDeptName" value="${dept.parentDeptName }" readonly />
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">부서ID</label>
					<input type="text" class="form-control" name="deptId" value="${dept.deptId}" readonly />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">부서명</label>
					<input type="text" class="form-control" name="deptName" value="${dept.deptName}" />
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">부서명 약어</label>
					<input type="text" class="form-control" name="simpleName" value="${dept.simpleName}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">부서메일ID</label>
					<input type="text" class="form-control" name="mailId" value="${dept.mailId}" />
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group no-margin">
					<label class="control-label">부서장</label>
					<select class="form-control" name="managerId">
						<option></option>
						<c:forEach var="curOption" items="${sboxUser}">
							<option value="${curOption.userId}" 
								<c:if test="${(dept.managerId).equals(curOption.userId)}">selected</c:if>>${curOption.userName}</option>
							</c:forEach>
					</select>
				</div>
			</div>
			
		</div>
	
	</div>
					
	<div class="modal-footer">
		<button type="submit" class="btn btn-info">확인</button>
		<button type="reset" class="btn btn-white" data-dismiss="modal">취소</button>
	</div>

</form>

<script type="text/javascript">

	jQuery(document).ready(function($) {
		
		sboxInit();
		
		$('#frmDept').validate({
			rules: {
				deptName: { required: true, maxlength: 100 }, 
				simpleName: { maxlength: 100 }, 
				mailId: { maxlength: 255, email: true }
			}, 
			submitHandler: function(form) {
	 			$.ajax({
					dataType: "json", 
					type: "post", 
					url: "${pageContext.request.contextPath}/admin/ajax/setSingleDept", 
					data: {
						dept: createNameElements()
					}, 
					success: function(data) {
						modalToggle(false);
						
						var opener = "${opener}";
						
						if (opener == 'jstree') {
							var instance = $('#jstreeDept').jstree(true);
							var selNode = instance.get_selected();
							instance.refresh(selNode);
						} else if (opener == 'datatable') {
							$('#tblDept').DataTable().ajax.reload(null, false);
						}
						
					} 
				});
			}
		});
		
	});

</script>
