<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="${pageContext.request.contextPath}/assets/js/xenon-custom.js"></script>

<form role="form" class="form-horizontal" id="frmUser">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">사용자 추가</h4>
	</div>
					
	<div class="modal-body">
	
		<div class="panel panel-headerless">
		
			<div class="panel-body">
				
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="activateYn">계정사용</label>
					</div>
					<div class="col-sm-9">
						<input type="checkbox" class="iswitch iswitch-secondary" 
							name="activateYn" <c:if test="${user.activateYn}">checked</c:if>>
					</div>
				</div>
					
				<div class="form-group-separator"></div>
		
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="userId">사용자ID</label>
					</div>
					<div class="col-sm-9">							
						<input type="text" class="form-control" name="userId" id="txtUserId" value="${user.userId}" />
						<input type="hidden" name="compId" value="${user.compId}" />
						<input type="hidden" name="deptId" value="${user.deptId}" />
					</div>
				</div>
					
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="userName">성명</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="userName" id="txtUserName" value="${user.userName}" />
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="password">패스워드</label>
					</div>
					<div class="col-sm-9">
						<input type="password" class="form-control" name="password" value="${user.password}" />
					</div>
				</div>	
			
				<div class="form-group-separator"></div>			
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="empNumber">사번</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="empNumber" value="${user.empNumber}" />
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="mailId">메일주소</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="mailId" value="${user.mailId}" />
					</div>
				</div>
				
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="jobTitleCode">직위</label>
					</div>
					<div class="col-sm-9">
							<select class="form-control" name="jobTitleCode" id="sboxJobTitle">
								<option></option>
								<c:forEach var="curOption" items="${sboxJobTitle}">
								<option value="${curOption.id}" 
									<c:if test="${(user.jobTitleCode).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
								</c:forEach>
							</select>
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="jobGradeCode">직급</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" name="jobGradeCode" id="sboxJobGrade">
							<option></option>
							<c:forEach var="curOption" items="${sboxJobGrade}">
							<option value="${curOption.id}" 
								<c:if test="${(user.jobGradeCode).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="jobRoleCode">직책</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" name="jobRoleCode" id="sboxJobRole">
							<option></option>
							<c:forEach var="curOption" items="${sboxJobRole}">
							<option value="${curOption.id}" 
								<c:if test="${(user.jobRoleCode).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="officePhone">사무실전화</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="officePhone" value="${user.officePhone}" />
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="fax">팩스</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="fax" value="${user.fax}" />
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="mobile">휴대전화</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="mobile" value="${user.mobile}" />
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="postCode">기본주소</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-info" type="button" id="btnAddress">주소검색</button>
							</span>
							<input type="text" class="form-control" name="postCode" id="txtPostCode" value="${user.postCode}" readonly />
						</div>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="address1" id="txtAddress1" value="${user.address1}" readonly />
					</div>
				</div>
				
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="postCode">상세주소</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="address2" value="${user.address2}" />
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="joinDate">입사일</label>
					</div>
					<div class="col-sm-9">
						<div class="input-group">
							<div class="input-group-addon"><a href="#"><i class="linecons-calendar"></i></a></div>
							<input type="text" class="form-control datepicker" 
								data-format="yyyy-mm-dd(D)" id="txtJoinDate" />
							<input type="hidden" name="joinDate" id="hdnJoinDate" value="${user.joinDate}" />
						</div>
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="resignDate">퇴사일</label>
					</div>
					<div class="col-sm-9">
						<div class="input-group">
							<div class="input-group-addon"><a href="#"><i class="linecons-calendar"></i></a></div>
							<input type="text" class="form-control datepicker" 
								data-format="yyyy-mm-dd(D)" id="txtResignDate" />
							<input type="hidden" name="resignDate" id="hdnResignDate" value="${user.resignDate}" />
						</div>
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="birthDate">생년월일</label>
					</div>
					<div class="col-sm-3">
						<div class="form-block">
							<label class="radio-inline">
								<input type="radio" name="useSolarYn" value="true" <c:if test="${user.useSolarYn}">checked</c:if> />양력
							</label>
							<label class="radio-inline">
								<input type="radio" name="useSolarYn" value="false" <c:if test="${!user.useSolarYn}">checked</c:if> />음력
							</label>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="input-group">
							<div class="input-group-addon"><a href="#"><i class="linecons-calendar"></i></a></div>
							<input type="text" class="form-control datepicker" 
								data-format="yyyy-mm-dd(D)" id="txtBirthDate" />
							<input type="hidden" name="birthDate" id="hdnBirthDate" value="${user.birthDate}" />
						</div>
					</div>
				</div>
				
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="userId">사용언어</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" id="sboxLanguage" name="languageCode">
							<option></option>
							<c:forEach var="curOption" items="${sboxLanguage}">
							<option value="${curOption.id}" 
								<c:if test="${(user.languageCode).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="securityLevel">보안등급</label>
					</div>
					<div class="col-sm-9">
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
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="entitlement">권한설정</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" name="entitlement">
							<option></option>
							<c:forEach var="curOption" items="${sboxEntitle}">
							<option value="${curOption.id}" 
								<c:if test="${(user.entitlement).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="photoFileId">사진이미지</label>
					</div>
					<div class="col-sm-9">
						<input type="file" class="form-control" name="photoFileId" />
					</div>
				</div>
			
				<div class="form-group-separator"></div>
			
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label" for="signFileId">서명이미지</label>
					</div>
					<div class="col-sm-9">
						<input type="file" class="form-control" name="signFileId" />
					</div>
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
		
		$('#txtUserName').on('input', function() {
			$('.anchor-user-name').html($(this).val());
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
					dataType: 'json', 
					type: 'post', 
					url: './ajax/setSingleUser', 
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
		
		$('#btnAddress').on('click', function() {
			var sUrl = './modal/addressTable';
			
			$.get(sUrl, function(data) {
				bootbox.dialog({
					title: "주소 검색", 
					message: data, 
					buttons: {
						main: {
							label: "닫기", 
							className: "btn-white"
						}
					}
				});
			});
		});
			
	});

</script>

<style>

	.modal .modal-dialog {
		width: 50%;
	}
	
	.modal .modal-body .panel {
		height: 400px;
		overflow-y: auto;
	}
	
	.datepicker {
		z-index: 100000 !important;
	}

</style>