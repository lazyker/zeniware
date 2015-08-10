<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<h1 class="title">커뮤니티</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="${pageContext.request.contextPath}/"><i class="fa-home"></i>Home</a></li>
			<li><a href="./comtMain">Community</a></li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<ul class="nav nav-tabs">
			<li class="active">
				<a href="#comtInfoEd" data-toggle="tab">
					<span class="visible-xs"><i class="fa-home"></i></span>
					<span class="hidden-xs">커뮤니티 정보 수정</span>
				</a>
			</li>
			<li>
				<a href="#comtAddUserIf" id="UserIf" data-toggle="tab">
					<span class="visible-xs"><i class="fa-home"></i></span>
					<span class="hidden-xs">가입 멤버</span>
				</a>
			</li>
			<li>
				<a href="#comtCloseIf" id="CloseIf" data-toggle="tab">
					<span class="visible-xs"><i class="fa-home"></i></span>
					<span class="hidden-xs">커뮤니티 페쇄</span>
				</a>
			</li>
			<li>
				<a href="#comtSendIf" id="SendIf" data-toggle="tab">
					<span class="visible-xs"><i class="fa-home"></i></span>
					<span class="hidden-xs">메일 알림</span>
				</a>
			</li>
		</ul>
		
		<div class="tab-content">
			<div class="tab-pane active" id="comtInfoEd">
				<div>
					<div class="row">
						<div class="form-group">
							<label for="txtCumtNm" class="col-sm-2 control-label">커뮤니티 명</label>
							<div class="col-sm-10">
								<input type="hidden" id="fcComtId" name="fcComtId" value="${comtVo.fcComtId}">
								<input type="text" class="form-control" data-validate="maxlength[50]" name="cumtNm" id="txtCumtNm" value="${comtVo.cumtNm}" />
							</div>
						</div>
					</div>
					<div class="row">
						<p>
							<div class="form-group">
								<div class="col-sm-2">
									<label for="txtCumtComment" class="control-label">커뮤니티<br />상세소개</label>
								</div>
								<div class="col-md-10">
									<textarea class="form-control" id="txtCumtComment" rows="5" data-validate="maxlength[150]">${comtVo.cumtComment}</textarea>
								</div>
								
							</div>
						</p>
					</div>
					<div class="row">
						<p>
							<div class="form-group">
								<div class="col-md-2">
									<label for="txtMastGubun" class="control-label">운영자</label>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" data-role="tagsinput" id="txtMastGubun" value="<c:forEach items="${useList}"  var="detail"  varStatus="status">${detail.USER_NAME},</c:forEach>" />
									<input type="hidden" id="userId" name="userId" value="<c:forEach items="${useList}"  var="detail"  varStatus="status">${detail.USER_ID},</c:forEach>">
								</div>
								<div class="form-group-separator"></div>
							</div>
						</p>
					</div>
					<div class="row">
						<p>
							<div class="form-group">
								<div class="col-md-2">
									<label for="radioOpenYn" class="control-label">공개유무</label>
								</div>
								<div class="col-md-10">
									<label class="control-label">
										<input type="radio" id="radioOpenYn" name="openYn" value="Y" class="cbr cbr-success" <c:if test="${comtVo.openYn == 'Y'}">checked</c:if> /> 공개
									</label>
									<label class="control-label">
										<input type="radio" id="radioOpenYn" name="openYn" value="N" class="cbr cbr-success" <c:if test="${comtVo.openYn == 'N'}">checked</c:if> /> 비공개
									</label>
								</div>
							</div>
						</p>
					</div>
					<p>
					<div class="row">
							<div class="form-group text-right">
								<button class="btn btn-secondary btn-icon" id="infoEdSave">Save changes</button>
								<button class="btn btn-gray btn-icon" id="infoEdCanse">Canse</button>
							</div>
					</div>
					</p>
				</div>
			</div>
<script type="text/javascript">
$(document).ready(function() {
	var fcComtId = "${fcComtId}";
	var msg01 = "운영자를 입력해 주세요.";
	var msg02 = "커뮤니티 정보 수정이 실해 하였습니다.";
	var msg03 = "커뮤니티 정보를 수정 하였습니다.";
	var param = {};

	$("#infoEdSave").on("click",  function() {
		if($("#txtMastGubun").val() == "") {
			toastr.options.positionClass = "toast-top-full-width";
			toastr.error("<div align='center'><b>" + msg01 + "</b></div>", null);
			return false;
		}

		param.fcComtId			= $("#fcComtId").val();
		param.cumtNm				= $("#txtCumtNm").val();
		param.cumtComment		= $("#txtCumtComment").val();
		param.openYn				= $("input[name=openYn]").val();
		var mastgu					= $("#txtMastGubun").val();
		var mastGuArr				= mastgu.split(",");
		param.txtMastGubun		= mastgu;
		
		alert($("#txtCumtNm").val());

		$.ajax({
			dataType: "json",
			type: "POST",
			url: "./insertUserComtBasicInfo",
			data: param,
			success: function(data) {
				if(data == 0) {
					toastr.options.positionClass = "toast-top-full-width";
					toastr.error("<div align='center'><b>" + msg02 + "</b></div>", null);
					return false;
				} else {
					toastr.options.positionClass = "toast-top-full-width";
					toastr.error("<div align='center'><b>" + msg03 + "</b></div>", null);
					return false;
				}
			}
		});
	});

	$("#infoEdCanse").click(function() {
		$(location).prop('href', './comtMain');
		return false;
	});

	/* $("#UserIf").on("click",  function() {
		param.fcComtId			= fcComtId;
		$('#comtMemList').DataTable({
			ajax: { "url": "./getComtAddUsrAllList?fcComtId="+fcComtId, "dataSrc": "" },
			deferRender: true,
			pagingType: "simple_numbers",
			data: param,
			aoColumns: [
				{ "mData": "fcComtId", "visible" : false },
				{ "mData": "userNm" },
				{ "mData": "userId", "visible" : false },
				{ "mData": "deptNm" },
				{ "mData": "talNum" },
				{ "mData": "mastGubun" , "mRender" : function(data,type, full){
						if(data == 'M') {
							return "운영자";
						} else {
							return "<input type='button' value='탈퇴처리' />";
						}
					}
				}
			],
			sDom: "<'row'<'col-sm-6'l><'col-sm-6'<'pull-right'f>>>rt<'row'<'col-xs-9'i><'col-xs-3'p>>"
		});
	}); */
	param.fcComtId			= fcComtId;
	$('#comtMemList').DataTable({
		ajax: { "url": "./getComtAddUsrAllList?fcComtId="+fcComtId, "dataSrc": "" },
		deferRender: true,
		pagingType: "simple_numbers",
		data: param,
		aoColumns: [
			{ "mData": "fcComtId", "visible" : false },
			{ "mData": "userNm" },
			{ "mData": "userId", "visible" : false },
			{ "mData": "deptNm" },
			{ "mData": "talNum" },
			{ "mData": "mastGubun" , "mRender" : function(data,type, full){
					if(data == 'M') {
						return "운영자";
					} else {
						return "<input type='button' value='탈퇴처리' />";
					}
				}
			}
		],
		sDom: "<'row'<'col-sm-6'l><'col-sm-6'<'pull-right'f>>>rt<'row'<'col-xs-9'i><'col-xs-3'p>>"
	});
});
</script>
			<div class="tab-pane" id="comtAddUserIf">
				<table id="comtMemList" class="table table-small-font table-striped table-bordered">
					<thead>
						<tr>
							<th>커뮤니티ID</th>
							<th>이름</th>
							<th>아이디</th>
							<th>부서명</th>
							<th>작성글 수</th>
							<th>탈퇴처리</th>
						</tr>
					</thead>
				</table>
			</div>

			<div class="tab-pane" id="comtCloseIf">
				<div>
					<div class="row">
						<div class="form-group">
							<div class="col-md-2">
								<label for="txtCloseNm" class="control-label">페쇄 이유</label>
							</div>
							<div class="col-md-9">
								<input type="text" class="form-control" id="txtCloseNm" maxlength="100" value="" />
							</div>
						</div>
					</div>
					<div class="row">
						<p>
							<div class="form-group">
								<div class="col-md-2">
									<label for="txtCloseCommentt" class="control-label">신청 상세 사유</label>
								</div>
								<div class="col-md-9">
									<textarea class="form-control" id="txtCloseCommentt" rows="5"></textarea>
								</div>
								<div class="form-group-separator"></div>
							</div>
						</p>
					</div>
					<div class="row">
						<p>
							<div class="form-group text-right">
								<button class="btn btn-primary btn-icon" id="closeIfSave">신청</button>
								<button class="btn btn-gray btn-icon" id="closeIfCanse">Canse</button>
							</div>
						</p>
					</div>
				</div>
			</div>

			<div class="tab-pane" id="comtSendIf">
				<div>
					<div class="row">
						<div class="form-group">
							<div class="col-md-2">
								<label for="txtMailNm" class="control-label">알림 제목</label>
							</div>
							<div class="col-md-9">
								<input type="text" class="form-control" id="txtMailNm" maxlength="100" value="" />
							</div>
						</div>
					</div>
					<div class="row">
						<p>
							<div class="form-group">
								<div class="col-md-2">
									<label for="txtMailComment" class="control-label">알림 내용</label>
								</div>
								<div class="col-md-9">
									<textarea class="form-control" id="txtMailComment" rows="5"></textarea>
								</div>
								<div class="form-group-separator"></div>
							</div>
						</p>
					</div>
					<div class="row">
						<p>
							<div class="form-group text-right">
								<button class="btn btn-primary btn-icon" id="sendIfSave">Save changes</button>
								<button class="btn btn-gray btn-icon" id="sendIfCanse">Canse</button>
							</div>
						</p>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>