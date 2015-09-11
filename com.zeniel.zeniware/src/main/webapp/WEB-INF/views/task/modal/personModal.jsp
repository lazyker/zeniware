<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form role="form" id="frmPerson">
	<input type="hidden" name="custSeq" value='<c:out value="${param.custSeq}"></c:out>' />
	<input type="hidden" name="userId" value='<c:out value="${personVo.userId}"></c:out>' />
	<c:if test="${!empty personVo.personSeq}">
		<input type="hidden" name="personSeq" value='<c:out value="${personVo.personSeq}"></c:out>' />
	</c:if>

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title"></h4>
	</div>

	<div class="modal-body">

		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">담당자 성명</label>
					<input type="text" class="form-control" name="personNm" value='<c:out value="${personVo.personNm}"></c:out>' />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">부서</label>
					<input type="text" class="form-control" name="deptNm" value='<c:out value="${personVo.deptNm}"></c:out>' />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">직위</label>
					<input type="text" class="form-control" name="jobTitleNm" value="${personVo.jobTitleNm}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">담당업무</label>
					<input type="text" class="form-control" name="businessNm" value="${personVo.businessNm}" />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">생년월일</label>
					<input type="text" class="form-control" name="birthday" value='<c:out value="${personVo.birthday}"></c:out>' />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">메일주소</label>
					<input type="text" class="form-control" name="mailId" value='<c:out value="${personVo.mailId}"></c:out>' />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">사무실 번호</label>
					<input type="text" class="form-control" name="officePhone" value='<c:out value="${personVo.officePhone}"></c:out>' />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">휴대폰 번호</label>
					<input type="text" class="form-control" name="mobilePhone" value='<c:out value="${personVo.mobilePhone}"></c:out>' />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">메모</label>
					<textarea class="form-control" rows="4" name="memo"><c:out value="${personVo.memo}"></c:out> </textarea>
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
	
	$(document).ready(function($) {
		
		/* 저장 */
		$('#frmPerson').validate({
			rules: {
				personNm: { required: true, maxlength: 15 }
			}, 
			submitHandler: function(form) {
				var url ="";
				('${param.status}' == 'new') ? url = './modal/setPerson' : url = './modal/modPerson';
				
	 			$.ajax({
					url: url, 
					data:	$('#frmPerson').serialize(), 
					success: function(data) {
						toastrAlert('success', '저장되었습니다.');
						modalToggle(false);
						
						$('#personList').DataTable().ajax.reload(null, false);
					} 
				});
			}
		});
		
	});
	
</script>