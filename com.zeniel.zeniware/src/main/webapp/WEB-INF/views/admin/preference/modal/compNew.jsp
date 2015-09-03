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
		<c:if test="${comp.compId.length() > 0}">
			<c:choose>
				<c:when test="${comp.useYn}">
					<div class="form-group pull-left">			
						<button type="button" class="btn btn-danger" id="btnSoftDelete">회사삭제</button>
						<button type="button" class="btn btn-gray" id="btnUnit">부서/사용자</button>
						<button type="button" class="btn btn-gray" id="btnDelDept">삭제부서</button>
						<button type="button" class="btn btn-gray" id="btnDelUser">삭제계정</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group pull-left">
						<button type="button" class="btn btn-danger" id="btnHardDelete">삭제</button>
						<button type="button" class="btn btn-gray" id="btnRestore">복원</button>
					</div>
				</c:otherwise>				
			</c:choose>	
		</c:if>
		
		<div class="form-group">
			<button type="submit" class="btn btn-info">확인</button>
			<button type="reset" class="btn btn-white" data-dismiss="modal">취소</button>
		</div>
	</div>

</form>

<script type="text/javascript">
	
	var curCompId = "${comp.compId}";

	jQuery(document).ready(function($) {
		
		/* 회사 삭제(Soft Delete) */
		$('#btnSoftDelete').on('click', function() {
			deleteComp('soft');
		});
		
		/* 부서/사용자 관리 */
		$('#btnUnit').on('click', function() {
			$(location).prop('href', './unitMain?compId=' + curCompId);
		});
		
		/* 삭제부서 관리 */
		$('#btnDelDept').on('click', function() {
			$(location).prop('href', './unitDeletedDept?compId=' + curCompId);
		});
		
		/* 삭제계정 관리 */
		$('#btnDelUser').on('click', function() {
			$(location).prop('href', './unitDeletedUser?compId=' + curCompId);
		});
		
		/* 회사 삭제(Hard Delete) */
		$('#btnHardDelete').on('click', function() {
			deleteComp('hard');
		});
		
		/* 회사 복원 */
		$('#btnRestore').on('click', function() {
			bootbox.confirm("복원하시겠습니까?", function(result) {
				if (result) {
					$.ajax({
						dataType: 'json', 
						type: 'post', 
						url: './ajax/restoreSingleComp', 
						data: { compId: curCompId }, 
						success: function(data) {
							toastrAlert('success', '복원되었습니다.');
							modalToggle(false);
							
							$('#tblComp').DataTable().ajax.reload(null, false);
						} 
					});
				}
			});
		});
		
		/* 회사 정보 저장 */
		$('#frmComp').validate({
			rules: {
				compName: { required: true, maxlength: 50 }, 
				description: { maxlength: 250 }
			}, 
			submitHandler: function(form) {
	 			$.ajax({
					dataType: 'json', 
					type: 'post', 
					url: './ajax/setSingleComp', 
					data: {
						comp: createNameElements()
					}, 
					success: function(data) {
						toastrAlert('success', '저장되었습니다.');
						modalToggle(false);
						
						$('#tblComp').DataTable().ajax.reload(null, false);
					} 
				});
			}
		});
		
		function deleteComp(delMode) {
			bootbox.confirm("삭제하시겠습니까?", function(result) {
				if (result) {
					$.ajax({
						dataType: 'json', 
						type: 'post', 
						url: './ajax/deleteSingleComp', 
						data: { mode: delMode, compId: curCompId }, 
						success: function(data) {
							toastrAlert('success', '삭제되었습니다.');
							modalToggle(false);
							
							$('#tblComp').DataTable().ajax.reload(null, false);
						} 
					});
				}
			});
		}

	});
	
/* ***References***
	ajax.reload(callback, resetPaging): https://datatables.net/reference/api/ajax.reload()
*/

</script>
