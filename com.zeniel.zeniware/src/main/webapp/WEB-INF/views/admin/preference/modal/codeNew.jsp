<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form role="form" id="frmCode">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">코드 추가</h4>
	</div>

	<div class="modal-body">
	
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<input type="checkbox" class="iswitch iswitch-secondary" 
						name="useYn" <c:if test="${code.useYn}">checked</c:if> />
				</div>
			</div>
			
		</div>

		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="groupId">그룹ID</label>
					<input type="text" class="form-control" name="groupId" id="txtGroupId" value="${code.groupId}" readonly>
				</div>
			</div>
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="codeId">코드ID</label>
					<input type="text" class="form-control" name="codeId" id="txtCodeId" value="${code.codeId}" />
					<input type="hidden" name="orgCodeId" value="${code.codeId}">
				</div>
			</div>
		
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="codeNameKo">코드명(Ko)</label>
					<input type="text" class="form-control" name="codeNameKo" value="${code.codeNameKo}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="codeNameEn">코드명(En)</label>
						<input type="text" class="form-control" name="codeNameEn" value="${code.codeNameEn}" />
				</div>
			</div>
		
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="codeNameZh">코드명(Zh)</label>
					<input type="text" class="form-control" name="codeNameZh" value="${code.codeNameZh}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="codeNameJa">코드명(Ja)</label>
					<input type="text" class="form-control" name="codeNameJa" value="${code.codeNameJa}" />
				</div>
			</div>
		
		</div>

		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="description">상세설명</label>
						<textarea class="form-control" cols="2" name="description">${code.description}</textarea>
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

		/* 코드 정보 저장 */
		$('#frmCode').validate({
			rules: {
				codeId: { required: true, maxlength: 5 }, 
				codeNameKo: { required: true, maxlength: 50 }, 
				codeNameEn: { maxlength: 50 }, 
				codeNameZh: { maxlength: 50 }, 
				codeNameJa: { maxlength: 50 }, 
				description: { maxlength: 250 }
			}, 
			submitHandler: function(form) {
				var orgCodeId = "${code.codeId}";
				var curCodeId = $('#txtCodeId').val();
				var curGroupId = $('#txtGroupId').val();

				if (jQuery.isEmptyObject(orgCodeId) || curCodeId != orgCodeId) {
					$.ajax({
						dataType: 'json', 
						type: 'post', 
						url: './ajax/getSingleCodeExists', 
						data: { groupId: curGroupId, codeId: curCodeId }, 
						success: function(data) {
							if (data > 0) {
								toastrAlert('error', '이미 등록된 코드입니다.');
							} else {
								setSingleCodeCallback();
							}
						}
					});
				} else {
					setSingleCodeCallback();
				}	
			}
		});
		
	});
	
	function setSingleCodeCallback() {
		$.ajax({
			dataType: "json", 
			type: "post", 
			url: './ajax/setSingleCode', 
			data: {
				code: createNameElements()
			}, 
			success: function(data) {
				toastrAlert('success', '저장되었습니다.');
				modalToggle(false);
				
				var opener = "${opener}";
				
				if (opener == "group") {
					$('#tblGroup').DataTable().ajax.reload(null, false);
				} else if (opener == "code") {
					$('#tblCode').DataTable().ajax.reload(null, false);
				}
			} 
		});
	}
	
/* ***References***

*/

</script>
