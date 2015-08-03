<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="frm" method="post">

	<div class="panel panel-headerless">
	
		<div class="panel-body">
		
			<div class="member-form-add-header">
				<div class="row">
				
					<div class="col-md-2 col-sm-4 pull-right-sm">
						<div class="action-buttons">
							<button type="button" class="btn btn-block btn-secondary btn-save">저장</button>
							<button type="button" class="btn btn-block btn-gray btn-cancel">취소</button>
						</div>
					</div>
				
					<div class="col-md-10 col-sm-8">
						<div class="user-img">
							<img src="${pageContext.request.contextPath}/assets/images/user-4.png" class="img-circle" alt="user-pic" />
						</div>
						<div class="user-name">
							<a href="#" class="anchor-user-name">신규 사용자</a>
							<span>${deptName}</span>
						</div>
					</div>	
					
				</div>
			</div>
			
			<div class="member-form-inputs">
			
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="activateYn">계정사용</label>
					</div>
					<div class="col-sm-9">
						<input type="checkbox" class="iswitch iswitch-secondary" name="activateYn" checked="${user.activateYn}">
					</div>
				</div>
			
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">사용자ID</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="userId" id="txtUserId" value="${user.userId}" />
						<input type="hidden" name="compId" value="${user.compId}" />
						<input type="hidden" name="deptId" value="${user.deptId}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userName">성명</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="userName" id="txtUserName" value="${user.userName}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="password">패스워드</label>
					</div>
					<div class="col-sm-9">
						<input type="password" class="form-control" name="password" value="${user.password}" />
					</div>
				</div>				
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="empNumber">사번</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="empNumber" value="${user.empNumber}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="mailId">메일주소</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="mailId" value="${user.mailId}" />
					</div>
				</div>
				
				<div class="row">
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
				
				<div class="row">
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
				
				<div class="row">
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
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="officePhone">사무실전화</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="officePhone" value="${user.officePhone}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="fax">팩스</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="fax" value="${user.fax}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="mobile">휴대전화</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="mobile" value="${user.mobile}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="postCode">주소</label>
					</div>
					<div class="col-sm-2">
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-info" type="button">우편번호</button>
							</span>
							<input type="text" class="form-control" name="postCode" value="${user.postCode}" readonly />
						</div>
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="address1" value="${user.address1}" />
					</div>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="address2" value="${user.address2}" />
					</div>
				</div>
				
				<div class="row">
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
				
				<div class="row">
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
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="birthDate">생년월일</label>
					</div>
					<div class="col-sm-2">
						<div class="form-block">
							<label class="radio-inline"><input type="radio" name="useSolarYn" id="radioSolar">양력</label>
							<label class="radio-inline"><input type="radio" name="useSolarYn" id="radioLunar">음력</label>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="input-group">
							<div class="input-group-addon"><a href="#"><i class="linecons-calendar"></i></a></div>
							<input type="text" class="form-control datepicker" 
								data-format="yyyy-mm-dd(D)" id="txtBirthDate" />
							<input type="hidden" name="birthDate" id="hdnBirthDate" value="${user.birthDate}" />
						</div>
					</div>
				</div>
				
				<div class="row">
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
				
				<div class="row">
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
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="sortOrder">정렬순서</label>
					</div>
					<div class="col-sm-9">
						<div class="input-group spinner" data-step="1" data-min="0" data-max="999">
							<span class="input-group-btn">
								<button class="btn btn-gray" data-type="decrement">-</button>
							</span>
							<input type="text" class="form-control text-center" name="sortOrder" value="${user.sortOrder}" />
							<span class="input-group-btn">
								<button class="btn btn-gray" data-type="increment">+</button>
							</span>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="entitlement">권한설정</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" id="s2example" name="entitlement">
							<option></option>
							<c:forEach var="curOption" items="${sboxEntitle}">
							<option value="${curOption.id}" 
								<c:if test="${(user.entitlement).equals(curOption.id)}">selected</c:if>>${curOption.text}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="photoFileId">사진이미지</label>
					</div>
					<div class="col-sm-9">
						<input type="file" class="form-control" name="photoFileId" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="signFileId">서명이미지</label>
					</div>
					<div class="col-sm-9">
						<input type="file" class="form-control" name="signFileId" />
					</div>
				</div>
				
				<div class="row">
				
					<div class="member-form-add-header">
						<div class="col-md-2 col-sm-4 pull-right-sm">
							<div class="action-buttons">
								<button type="button" class="btn btn-block btn-secondary btn-save">저장</button>
								<button type="button" class="btn btn-block btn-gray btn-cancel">취소</button>
							</div>
						</div>
						
						<div class="col-md-10 col-sm-8">
							<div class="user-img">
								<img src="${pageContext.request.contextPath}/assets/images/user-4.png" class="img-circle" alt="user-pic" />
							</div>
							<div class="user-name">
								<a href="#" class="anchor-user-name">신규 사용자</a>
								<span>${deptName}</span>
							</div>
						</div>
					</div>
				
			</div>
		
		</div>
		
	</div>

</form>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		var paramCompId = "${compId}";
		var paramDeptId = "${deptId}";
		
		var paramUserId = "${user.userId}";
		var paramUserName = "${user.userName}";
		var paramJoinDate = "${user.joinDate.substring(0, 10)}";
		var paramResignDate = "${user.resignDate.substring(0, 10)}";
		var paramBirthDate = "${user.birthDate.substring(0, 10)}";
		var paramUseLunarYn = ${user.useLunarYn};
		
		$('#txtUserId').prop('readonly', jQuery.isEmptyObject(paramUserId) ? false : true);
		$('.anchor-user-name').html(jQuery.isEmptyObject(paramUserName) ? '신규 사용자' : paramUserName);
		$('#txtJoinDate').datepicker(jQuery.isEmptyObject(paramJoinDate) ? '' : 'update', paramJoinDate);
		$('#txtResignDate').datepicker(jQuery.isEmptyObject(paramResignDate) ? '' : 'update', paramResignDate);
		$('#txtBirthDate').datepicker(jQuery.isEmptyObject(paramBirthDate) ? '' : 'update', paramBirthDate);
		paramUseLunarYn == true ? $('#radioLunar').prop('checked', true) : $('#radioSolar').prop('checked', true);
		
		$('#txtUserName').on('input', function() {
			if ($(this).val().length == 0) {
				$('.anchor-user-name').html("신규 사용자");
				
			} else {
				$('.anchor-user-name').html($(this).val());
			}			
		});
		
		$('.datepicker').on('changeDate', function() {
			var hiddenObj = $(this).prop('id').substr(3); 
			$('#hdn' + hiddenObj).val($(this).data('datepicker').getFormattedDate('yyyy-mm-dd'));
		});
				
		$('.btn-cancel').click(function() {
			$(location).prop('href', './unitMain?compId=' + paramCompId + '&deptId=' + paramDeptId);
			return false;
		});
		
		$('.btn-save').click(function() {
			$('#frm').prop('action', './unitNewUser').submit();
		});
		
	});
	
</script>