<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="panel panel-default">

	<div class="panel-heading">
		<h3 class="panel-title">공통 코드 등록</h3>
	</div>
	
	<div class="panel-body">
		
		<form role="form" class="form-horizontal validate" id="frm" method="POST">
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="groupId">그룹ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="groupId" id="txtGroupId" 
						value="${commonCode.groupId}" readonly>
				</div>
			</div>
			
			<div class="form-group-separator"></div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="codeId">코드ID</label>
				<div class="col-sm-10">
					<input type="hidden" name="orgCodeId" value="${commonCode.codeId}">
					<input type="text" class="form-control" name="codeId" id="txtCodeId" 
						value="${commonCode.codeId}" data-validate="required,maxlength[5]" placeholder="CodeID">
				</div>
			</div>
			
			<div class="form-group-separator"></div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="codeNameKo">코드명(Ko)</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="codeNameKo" 
						value="${commonCode.codeNameKo}" data-validate="required,maxlength[50]" placeholder="CodeName - Korean">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="codeNameEn">코드명(En)</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="codeNameEn" 
						value="${commonCode.codeNameEn}" data-validate="maxlength[50]" placeholder="CodeName - English">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="codeNameZh">코드명(Zh)</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="codeNameZh" 
						value="${commonCode.codeNameZh}" data-validate="maxlength[50]" placeholder="CodeName - Chinese">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="codeNameJa">코드명(Ja)</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="codeNameJa" 
						value="${commonCode.codeNameJa}" data-validate="maxlength[50]" placeholder="CodeName - Japanese">
				</div>
			</div>
						
			<div class="form-group-separator"></div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="sortOrder">정렬순서</label>
				<div class="col-sm-10">
					<div class="input-group spinner" data-step="1" data-min="0" data-max="999">
						<span class="input-group-btn">
							<button class="btn btn-gray" data-type="decrement">-</button>
						</span>
						<input type="text" class="form-control text-center" value="${commonCode.sortOrder}" name="sortOrder" />
						<span class="input-group-btn">
							<button class="btn btn-gray" data-type="increment">+</button>
						</span>
					</div>
				</div>
			</div>
			
			<div class="form-group-separator"></div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="useYn">사용여부</label>
				<div class="col-sm-10">
					<input type="checkbox" class="iswitch iswitch-secondary" name="useYn" id="chkUseYn">
				</div>
			</div>
			
			<div class="form-group-separator"></div>
						
			<div class="form-group">
				<label class="col-sm-2 control-label" for="description">상세설명</label>
				<div class="col-sm-10">
					<textarea class="form-control" cols="2" name="description" data-validate="maxlength[250]">${commonCode.description}</textarea>
				</div>
			</div>
			
			<div class="form-group-separator"></div>
			
			<div class="form-group text-right">
				<button type="button" class="btn btn-primary" id="btnSave">확인</button>
				<button type="reset" class="btn btn-white" id="btnClose">닫기</button>
			</div>
			
		</form>
		
	</div>

</div>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		var useYn = ${commonCode.useYn};
		$("#chkUseYn").prop('checked', useYn);
		
		$("#btnClose").click(function() {
			var curGroupId = "${commonCode.groupId}";
			$(location).prop('href', './codeMain?groupId=' + curGroupId);
			
			return false;
		});
		
		$("#btnSave").click(function() {
			var orgCodeId = "${commonCode.codeId}";
			var curCodeId = $('#txtCodeId').val();
			var curGroupId = $('#txtGroupId').val();

			if (jQuery.isEmptyObject(orgCodeId) || curCodeId != orgCodeId) {
				$.ajax({
					url: '../ajax/getSingleCodeExists', 
					type: 'POST', 
					data: { groupId: curGroupId, codeId: curCodeId }, 
					dataType: 'json'
					
				}).done(function(data) {
					if (data > 0) {
						toastrAlert('error', '이미 등록된 코드입니다.');
						
					} else {
						$("#frm").prop('action', './codeNew').submit();
					}
				});
				
			} else {
				$("#frm").prop('action', './codeNew').submit();
			}
		});
	});
	
</script>