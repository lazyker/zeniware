<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="${pageContext.request.contextPath}/assets/js/xenon-custom.js"></script>

<form role="form" id="frmUser">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">사용자 추가</h4>
	</div>
					
	<div class="modal-body">
	
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<input type="checkbox" class="iswitch iswitch-secondary" 
						name="activateYn" <c:if test="${user.activateYn}">checked</c:if> />
				</div>
			</div>
			
		</div>
	
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">부서ID</label>
					<input type="text" class="form-control" name="deptId" value="${user.deptId}" readonly />
					<input type="hidden" name="compId" value="${user.compId}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">부서명</label>
					<input type="text" class="form-control" name="deptName" value="${user.deptName }" readonly />
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">사용자ID</label>
					<input type="text" class="form-control" name="userId" 
						value="${user.userId}" <c:if test="${user.userId.length() > 0}">readonly</c:if> />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">성명</label>
					<input type="text" class="form-control" name="userName" value="${user.userName }" />
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">암호</label>
					<input type="password" class="form-control" name="password" value="${user.password}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">사번</label>
					<input type="text" class="form-control" name="empNumber" value="${user.empNumber }" />
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">메일</label>
					<input type="text" class="form-control" name="mailId" value="${user.mailId}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">사무실전화</label>
					<input type="text" class="form-control" name="officePhone" value="${user.officePhone }" />
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">휴대전화</label>
					<input type="text" class="form-control" name="mobile" value="${user.mobile}" />
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">팩스</label>
					<input type="text" class="form-control" name="fax" value="${user.fax }" />
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">입사일</label>
					<div class="input-group">
						<div class="input-group-addon"><i class="linecons-calendar"></i></div>
						<input type="text" class="form-control datepicker" data-format="yyyy-mm-dd(D)" id="txtJoinDate" />
						<input type="hidden" name="joinDate" id="hdnJoinDate" value="${user.joinDate}" />
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label">퇴사일</label>
					<div class="input-group">
						<div class="input-group-addon"><i class="linecons-calendar"></i></div>
						<input type="text" class="form-control datepicker" data-format="yyyy-mm-dd(D)" id="txtResignDate" />
						<input type="hidden" name="resignDate" id="hdnResignDate" value="${user.resignDate}" />
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">직위</label>
					<select class="form-control" name="jobTitleCode">
						<option></option>
						<c:forEach var="curOption" items="${sboxJobTitle}">
						<option value="${curOption.id}" 
							<c:if test="${(user.jobTitleCode).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		
		</div>
		
		<div class="row">
			
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">직책</label>
					<select class="form-control" name="jobRoleCode">
						<option></option>
						<c:forEach var="curOption" items="${sboxJobRole}">
						<option value="${curOption.id}" 
							<c:if test="${(user.jobRoleCode).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">직급</label>
					<select class="form-control" name="jobGradeCode">
						<option></option>
						<c:forEach var="curOption" items="${sboxJobGrade}">
						<option value="${curOption.id}" 
							<c:if test="${(user.jobGradeCode).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
		</div>
		
		<div class="row">
			
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">사용언어</label>
					<select class="form-control" name="languageCode">
						<option></option>
						<c:forEach var="curOption" items="${sboxLanguage}">
						<option value="${curOption.id}" 
							<c:if test="${(user.languageCode).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		
		</div>
		
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">생년월일</label>&nbsp;&nbsp;
					<label class="radio-inline">
						<input type="radio" name="useSolarYn" id="radioSolar" 
							value="true" <c:if test="${user.useSolarYn}">checked</c:if>>양력
					</label>
					<label class="radio-inline">
						<input type="radio" name="useSolarYn" id="radioLunar" 
							value="false" <c:if test="${!user.useSolarYn}">checked</c:if>>음력
					</label>
					<div class="input-group">
						<div class="input-group-addon"><i class="linecons-calendar"></i></div>
						<input type="text" class="form-control datepicker" data-format="yyyy-mm-dd(D)" id="txtBirthDate" />
						<input type="hidden" name="birthDate" id="hdnBirthDate" value="${user.birthDate}" />
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">보안등급</label>
					<div class="input-group spinner" data-step="1" data-min="1" data-max="10">
						<span class="input-group-btn">
							<button class="btn btn-gray" data-type="decrement">-</button>
						</span>
						<input type="text" class="form-control text-center" name="securityLevel" value="${user.securityLevel}" />
						<span class="input-group-btn">
							<button class="btn btn-gray" data-type="increment">+</button>
						</span>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">권한설정</label>
					<select class="form-control" id="s2example" name="entitlement">
						<option></option>
						<c:forEach var="curOption" items="${sboxEntitle}">
						<option value="${curOption.id}" 
							<c:if test="${(user.entitlement).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
		</div>
		
		<div class="row">
	
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">사진이미지</label>
					<input type="file" class="form-control" name="photoFileId" />
				</div>
			</div>
			
		</div>
		
		<div class="row">
			
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">서명이미지</label>
					<input type="file" class="form-control" name="signFileId" />
				</div>
			</div>
		
		</div>
		
	</div>
					
	<div class="modal-footer">
		<button type="submit" class="btn btn-info" id="btnSave">확인</button>
		<button type="reset" class="btn btn-white" data-dismiss="modal">취소</button>
	</div>

</form>

<script type="text/javascript">

	jQuery(document).ready(function($) {
		
		sboxInit();
		
		var userJoinDate = "${user.joinDate.substring(0, 10)}";
		var userResignDate = "${user.resignDate.substring(0, 10)}";
		var userBirthDate = "${user.birthDate.substring(0, 10)}";
		
		$('#txtJoinDate').datepicker(jQuery.isEmptyObject(userJoinDate) ? '' : 'update', userJoinDate);
		$('#txtResignDate').datepicker(jQuery.isEmptyObject(userResignDate) ? '' : 'update', userResignDate);
		$('#txtBirthDate').datepicker(jQuery.isEmptyObject(userBirthDate) ? '' : 'update', userBirthDate);
		
		$('.datepicker').on('changeDate', function() {
			var hdnObj = $(this).prop('id').substr(3);
			$('#hdn' + hdnObj).val($(this).data('datepicker').getFormattedDate('yyyy-mm-dd'));
		}).on('input', function() {
			if ($(this).val() == "") {
				var hdnObj = $(this).prop('id').substr(3);
				$('#hdn' + hdnObj).val("");
			}
		});
		
		$('#frmUser').validate({
			rules: {
				userId: { required: true, maxlength: 20 }, 
				userName: { required: true, maxlength: 100 }, 
				password: { required: true, maxlength: 255 }, 
				empNumber: { maxlength: 255 }, 
				mailId: { maxlength: 255, email: true }, 
				officePhone: { maxlength: 50 }, 
				mobile: { maxlength: 50 }, 
				fax: { maxlength: 50 }, 
				securityLevel: { required: true, min: 1, max: 10 }
			}, 
			submitHandler: function(form, event) {
				$.ajax({
					dataType: "json", 
					type: "post", 
					url: "${pageContext.request.contextPath}/admin/ajax/setSingleUser", 
					data: {
						user: createNameElements()
					}, 
					success: function(data) {
						modalToggle(false);
						$('#tblUser').DataTable().ajax.reload(null, false);
					} 
				});
			}
		});
		
	});

</script>

<style>

	.modal .modal-dialog {
		width: 50%;
	}
	
	.modal .modal-body {
		height: 500px;
		overflow-x: hidden;
		overflow-y: auto;
	}
	
	.datepicker {
		z-index: 100000 !important;
	}

</style>