<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form method="post">

	<div class="panel panel-headerless">
	
		<div class="panel-body">
		
			<div class="member-form-add-header">
				<div class="row">
				
					<div class="col-md-2 col-sm-4 pull-right-sm">
						<div class="action-buttons">
							<button type="button" id="btnSave" class="btn btn-block btn-secondary">저장</button>
							<button type="button" id="btnCancel" class="btn btn-block btn-gray">취소</button>
						</div>
					</div>
				
					<div class="col-md-10 col-sm-8">
						<div class="user-img">
							<img src="${pageContext.request.contextPath}/assets/images/user-4.png" class="img-circle" alt="user-pic" />
						</div>
						<div class="user-name">
							<a href="#" id="anchorUserName">신규 사용자</a>
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
						<input type="checkbox" class="iswitch iswitch-secondary" name="activateYn">
					</div>
				</div>
			
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">사용자ID</label>
					</div>
					<div class="col-sm-9">
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-info" type="button">중복확인</button>
							</span>
							<input type="text" class="form-control" name="userId" />
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">성명</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="userName" id="txtUserName" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">패스워드</label>
					</div>
					<div class="col-sm-9">
						<input type="password" class="form-control" name="password">
					</div>
				</div>				
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">사번</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="empNumber" value="" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">메일주소</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="mailId" value="" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">직위</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" id="sboxJobTitle">
							<option>직위를 선택하세요...</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="jobTitle">직급</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" id="sboxJobGrade">
							<option>직급을 선택하세요...</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="jobRole">직책</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" id="sboxJobRole">
							<option>직책을 선택하세요...</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">사무실전화</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="officePhone" value="" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="fax">팩스</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="fax" value="" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="mobile">휴대전화</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="mobile" value="" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="address1">주소</label>
					</div>
					<div class="col-sm-2">
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-info" type="button">우편번호</button>
							</span>
							<input type="text" class="form-control" name="zipcode" value="" readonly />
						</div>
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="address1" value="" />
					</div>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="address2" value="" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="joinDate">입사일</label>
					</div>
					<div class="col-sm-9">
						<div class="input-group">
							<div class="input-group-addon"><a href="#"><i class="linecons-calendar"></i></a></div>
							<input type="text" class="form-control datepicker" data-format="yyyy-MM-dd(D)" data-start-view="2" name="joinDate">
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
							<input type="text" class="form-control datepicker" data-format="yyyy-MM-dd(D)" data-start-view="2" name="resignDate">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">생년월일</label>
					</div>
					<div class="col-sm-2">
						<div class="form-block">
							<label class="radio-inline"><input type="radio" name="rdLunar" checked>양력</label>
							<label class="radio-inline"><input type="radio" name="rdLunar">음력</label>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="input-group">
							<div class="input-group-addon"><a href="#"><i class="linecons-calendar"></i></a></div>
							<input type="text" class="form-control datepicker" data-format="yyyy-MM-dd(D)" data-start-view="2">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">사용언어</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" id="sboxLanguage">
							<option>언어를 선택하세요...</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">보안등급</label>
					</div>
					<div class="col-sm-9">
						<div class="input-group spinner" data-step="1" data-min="1" data-max="10">
							<span class="input-group-btn">
								<button class="btn btn-gray" data-type="decrement">-</button>
							</span>
							<input type="text" class="form-control text-center" value="10" name="securityLevel" />
							<span class="input-group-btn">
								<button class="btn btn-gray" data-type="increment">+</button>
							</span>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">정렬순서</label>
					</div>
					<div class="col-sm-9">
						<div class="input-group spinner" data-step="1" data-min="0" data-max="999">
							<span class="input-group-btn">
								<button class="btn btn-gray" data-type="decrement">-</button>
							</span>
							<input type="text" class="form-control text-center" value="0" name="sortOrder" />
							<span class="input-group-btn">
								<button class="btn btn-gray" data-type="increment">+</button>
							</span>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">권한설정</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control" id="s2example" multiple>
							<option></option>
							<option value="1">Manager</option>
							<option value="2">Admin</option>
							<option value="3">Power User</option>
							<option value="4">User</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">사진이미지</label>
					</div>
					<div class="col-sm-9">
						<input type="file" class="form-control">
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" for="userId">서명이미지</label>
					</div>
					<div class="col-sm-9">
						<input type="file" class="form-control">
					</div>
				</div>
			
			</div>
		
		</div>
		
	</div>

</form>

<!-- <div class="row"> -->

<!-- 	<div class="col-sm-6"> -->
	
<!-- 		<div class="panel panel-default"> -->
		
<!-- 			<div class="panel-heading"> -->
<!-- 				<h3 class="panel-title">기본 정보</h3> -->
				
<!-- 				<div class="panel-options"> -->
<!-- 					<input type="checkbox" class="iswitch iswitch-secondary" name="activateYn"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="panel-body"> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">부서명</label> -->
<!-- 					<input type="text" class="form-control" name="deptName" readonly> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">사용자ID</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">패스워드</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">성명</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">사번</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">메일주소</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">직위</label> -->
<!-- 					<select class="form-control" id="sboxJobTitle"> -->
<!-- 						<option>직위를 선택하세요...</option> -->
<!-- 						<option value="">사원</option> -->
<!-- 						<option value="">주임</option> -->
<!-- 						<option value="">대리</option> -->
<!-- 						<option value="">과장</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">직급</label> -->
<!-- 					<select class="form-control" id="sboxJobGrade"> -->
<!-- 						<option>직급을 선택하세요...</option> -->
<!-- 						<option value="">사원</option> -->
<!-- 						<option value="">주임</option> -->
<!-- 						<option value="">대리</option> -->
<!-- 						<option value="">과장</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">직책</label> -->
<!-- 					<select class="form-control" id="sboxJobRole"> -->
<!-- 						<option>직책을 선택하세요...</option> -->
<!-- 						<option value="">팀원</option> -->
<!-- 						<option value="">팀장</option> -->
<!-- 						<option value="">본부장</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">담당업무</label> -->
<!-- 					<textarea class="form-control" cols="2" name="description" data-validate="maxlength[250]"></textarea> -->
<!-- 				</div> -->
								
<!-- 			</div> -->
		
<!-- 		</div> -->
	
<!-- 	</div> -->
	
<!-- 	<div class="col-sm-6"> -->
	
<!-- 		<div class="panel panel-default"> -->
		
<!-- 			<div class="panel-heading"> -->
<!-- 				<h3 class="panel-title">상세 정보</h3> -->
<!-- 			</div> -->
			
<!-- 			<div class="panel-body"> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">사무실전화</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">팩스</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">휴대전화</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">보안등급</label> -->
<!-- 					<div class="input-group spinner" data-step="1" data-min="1" data-max="10"> -->
<!-- 						<span class="input-group-btn"> -->
<!-- 							<button class="btn btn-gray" data-type="decrement">-</button> -->
<!-- 						</span> -->
<!-- 						<input type="text" class="form-control text-center" value="10" name="securityLevel" /> -->
<!-- 						<span class="input-group-btn"> -->
<!-- 							<button class="btn btn-gray" data-type="increment">+</button> -->
<!-- 						</span> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">정렬순서</label> -->
<!-- 					<div class="input-group spinner" data-step="1" data-min="1" data-max="999"> -->
<!-- 						<span class="input-group-btn"> -->
<!-- 							<button class="btn btn-gray" data-type="decrement">-</button> -->
<!-- 						</span> -->
<!-- 						<input type="text" class="form-control text-center" value="0" name="securityLevel" /> -->
<!-- 						<span class="input-group-btn"> -->
<!-- 							<button class="btn btn-gray" data-type="increment">+</button> -->
<!-- 						</span> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">권한설정</label> -->
<!-- 					<input type="text" class="form-control" name="deptName"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">생년월일</label> -->
<!-- 					<div class="input-group"> -->
<!-- 						<input type="text" class="form-control datepicker" data-format="yyyy-MM-dd(D)" data-start-view="2"> -->
<!-- 						<div class="input-group-addon"><a href="#"><i class="linecons-calendar"></i></a></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">사용언어</label> -->
<!-- 					<select class="form-control" id="sboxLanguage"> -->
<!-- 						<option>언어를 선택하세요...</option> -->
<!-- 						<option value="KO">한국어</option> -->
<!-- 						<option value="EN">영어</option> -->
<!-- 						<option value="CN">중국어</option> -->
<!-- 						<option value="JP">일본어</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">사진이미지</label> -->
<!-- 					<input type="file" class="form-control"> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">서명이미지</label> -->
<!-- 					<input type="file" class="form-control"> -->
<!-- 				</div> -->
				
<!-- 			</div> -->
		
<!-- 		</div> -->
	
<!-- 	</div> -->

<!-- </div> -->

<!---------------------------------------------------------------------->

<!-- <div class="panel panel-default"> -->

<!-- 	<div class="panel-heading"> -->
<!-- 		<h3 class="panel-title">사용자 추가</h3> -->
<!-- 	</div> -->
	
<!-- 	<div class="panel-body"> -->
		
<!-- 		<form role="form" class="form-horizontal validate" id="frm" method="POST"> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="groupId">부서명</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="groupId" readonly> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">사용자ID</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">패스워드</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">성명</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">사번</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">메일주소</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">사무실전화</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">팩스</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">휴대전화</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">집전화</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">주소</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 					<br /> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 					<br /> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">프로필사진</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="file" class="form-control"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">서명이미지</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="file" class="form-control"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">보안등급</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">직위 / 직급 / 직책</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">권한설정</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">기본정보</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">생년월일</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<div class="input-group"> -->
<!-- 						<input type="text" class="form-control datepicker" data-format="yyyy-MM-dd(D)" data-start-view="2"> -->
<!-- 						<div class="input-group-addon"><a href="#"><i class="linecons-calendar"></i></a></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">사용언어</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<select class="form-control" id="sboxLanguage"> -->
<!-- 						<option>언어를 선택하세요...</option> -->
<!-- 						<option value="KO">한국어</option> -->
<!-- 						<option value="EN">영어</option> -->
<!-- 						<option value="CN">중국어</option> -->
<!-- 						<option value="JP">일본어</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">정렬순서</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="codeId" value=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">사용여부</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="checkbox" class="iswitch iswitch-secondary" name="useYn"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-2 control-label" for="codeId">활성화여부</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="checkbox" class="iswitch iswitch-secondary" name="activateYn"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group-separator"></div> -->
			
<!-- 			<div class="form-group text-right"> -->
<!-- 				<button type="button" class="btn btn-primary" id="btnSave">확인</button> -->
<!-- 				<button type="reset" class="btn btn-white" id="btnClose">닫기</button> -->
<!-- 			</div> -->
			
<!-- 		</form> -->
		
<!-- 	</div> -->

<!-- </div> -->

<script type="text/javascript">
	
	$(document).ready(function() {
		
		var paramCompId = "${compId}";
		var paramDeptId = "${deptId}";
		
		var sboxDefine = function(objId, groupId, langCode) {
			$('select#' + objId).selectBoxIt({
				populate: function() {
					var deferred = $.Deferred(), arr = [], x = -1;
					
					$.ajax({
						url: "../ajax/getSboxCodelist", 
						data: { groupId: groupId, langCode: langCode }
					}).done(function(data) {
						while(++x < data.length) {
							arr.push({ text: data[x].text, value: data[x].value });
						}
						
						deferred.resolve(arr);
					});
					
					return deferred;
				}
			})
		}
		
		$('#s2example').select2({
			placeholder: '할당할 권한을 선택하세요...', 
			allowClear: true
		}).on('select2-open', function() {
			$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
		});
		
		sboxDefine('sboxJobTitle', 'A0001', 'KO');
		sboxDefine('sboxJobGrade', 'A0002', 'KO');
		sboxDefine('sboxJobRole', 'A0003', 'KO');
		sboxDefine('sboxLanguage', 'A0004', 'KO');
		
		$('#txtUserName').on('input', function() {
			if ($(this).val().length == 0) {
				$('#anchorUserName').html("신규 사용자");
			} else {
				$('#anchorUserName').html($(this).val());
			}			
		});
				
		$('#btnCancel').click(function() {
			$(location).prop('href', './unitMain?compId=' + paramCompId + '&deptId=' + paramDeptId);
			return false;
		});
		
		$('#btnSave').click(function(event) {
		});
	});
	
</script>