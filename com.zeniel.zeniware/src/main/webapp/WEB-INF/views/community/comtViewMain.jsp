<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<h1 class="title">${comtInfo.CUMT_NM}</h1>
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
									<input type="text" class="form-control" readonly data-role="tagsinput" id="txtMastGubun" value="<c:forEach items="${useList}"  var="detail"  varStatus="status">${detail.USER_NAME},</c:forEach>" />
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
	var paramCompId = "${compId}";
	var fcComtId = "${fcComtId}";
	var msg01 = "운영자를 입력해 주세요.";
	var msg02 = "커뮤니티 정보 수정이 실패 하였습니다.";
	var msg03 = "커뮤니티 정보를 수정 하였습니다.";
	var msg04 = "페쇄 신청 사유를 입력 하셔야 합니다.";
	var msg05 = "알림 제목을 입력 하셔야 합니다.";
	var msg06 = "알림 내용을 입력 하셔야 합니다.";
	var msg07 = "중복된 커뮤니티명은 사용하실 수 없습니다.";
	var param = {};

	/* $("#txtMastGubun").tagsInput({
		'autocomplete_url': url_to_autocomplete_api,
		'autocomplete': { option: value, option: value},
		'height':'100px',
		'width':'300px',
		'interactive':true,
		'defaultText':'add a tag',
		'onAddTag':callback_function,
		'onRemoveTag':callback_function,
		'onChange' : callback_function,
		'delimiter': [',',';'],   // Or a string with a single delimiter. Ex: ';'
		'removeWithBackspace' : false,
		'minChars' : 0,
		'maxChars' : 0, // if not provided there is no limit
		'placeholderColor' : '#666666'
	}); */

	$("#sendIfSave").on("click",  function() {
		if($("#txtMailTitle").val() == "") {
			toastr.options.positionClass = "toast-top-full-width";
			toastr.error("<div align='center'><b>" + msg05 + "</b></div>", null);
			return false;
		}
		if($("#txtMailText").val() == "") {
			toastr.options.positionClass = "toast-top-full-width";
			toastr.error("<div align='center'><b>" + msg06 + "</b></div>", null);
			return false;
		}

		bootbox.confirm("메일을 발송하시겠습니까?", function(result) {
			if(result) {
				param.fcComtId			= fcComtId;
				param.mailTitle				= $("#txtMailTitle").val();
				param.mailText				= $("#txtMailText").val();

				$.ajax({
					dataType: "json",
					type: "POST",
					url: "./insertComtInfoMailSend",
					data: param,
					success: function(data) {
						$(location).prop('href', './comtMain');
						return;
					}
				});

			}
		});
	});

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
				} else if(data == 99) {
					toastr.options.positionClass = "toast-top-full-width";
					toastr.error("<div align='center'><b>" + msg07 + "</b></div>", null);
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
			{ "mData": "joinYn" , "mRender" : function(data,type, full){
					if(data == 'Y') {
						return "가입";
					} else {
						return "<input type='button' class='btn btn-info' value='가입처리' />";
					}
				}
			},
			{ "mData": "mastGubun", "visible" : false },
			//taltelGubun
			{ "mData": "taltelGubun" , "mRender" : function(data,type, full){
					if(data == 'Y') {
						return "운영자";
					} else if(data == 'N') {
						return "--";
					} else {
						return "<input type='button' class='btn btn-gray' id='btnDel' value='탈퇴처리' />";
					}
				}
			}
		],
		sDom: "<'row'<'col-sm-6'l><'col-sm-6'<'pull-right'f>>>rt<'row'<'col-xs-9'i><'col-xs-3'p>>"
	});

	$("#comtMemList tbody").on('click', "tr td:nth-child(4)", function() {
		var pos = $('#comtMemList').dataTable().fnGetPosition(this);
		var fcComtId = $('#comtMemList').dataTable().fnGetData(pos).fcComtId;
		var userId = $('#comtMemList').dataTable().fnGetData(pos).userId;
		var joinYn = $('#comtMemList').dataTable().fnGetData(pos).joinYn;

		if(joinYn == "N") {
			bootbox.confirm("가입승인 하시겠습니까?", function(result) {
				if(result) {
					var param = {};
					param.fcComtId = fcComtId;
					param.compId = paramCompId;
					param.userId = userId;
					$.ajax({
						dataType: "json",
						type: "POST",
						url: "./updateComtInfoMemUser",
						data: param,
						success: function(data) {
							//$(location).prop('href', './comtMain');
							$("#comtMemList").DataTable().ajax.url("./getComtAddUsrAllList?fcComtId="+fcComtId).load();
							return;
						}
					});
				}
			});
		}
	});

	$("#comtMemList tbody").on('click', "tr td:nth-child(5)", function() {
		var pos = $('#comtMemList').dataTable().fnGetPosition(this);
		var fcComtId = $('#comtMemList').dataTable().fnGetData(pos).fcComtId;
		var userId = $('#comtMemList').dataTable().fnGetData(pos).userId;
		var taltelGubun = $('#comtMemList').dataTable().fnGetData(pos).taltelGubun;

		if(taltelGubun == "D") {
			bootbox.confirm("탈퇴 처리 하시겠습니까?", function(result) {
				if(result) {
					var param = {};
					param.fcComtId = fcComtId;
					param.compId = paramCompId;
					param.userId = userId;
					$.ajax({
						dataType: "json",
						type: "POST",
						url: "./deleteComtInfoMemUser",
						data: param,
						success: function(data) {
							$("#comtMemList").DataTable().ajax.url("./getComtAddUsrAllList?fcComtId="+fcComtId).load();
							//$(location).prop('href', './comtMain');
							return;
						}
					});
					
				}
			});
		}
	});

	var $state = $("#comtCloseIf input[type='checkbox']");
	$state.on('change', function(ev) {
		var $chcks = $("#comtCloseIf input[type='checkbox']");
		if ($state.is(':checked')) {
			bootbox.alert("커뮤니티 전체 멤버에게 페쇄 알림이 갑니다.");
		}
	});

	$("#closeIfSave").on("click",  function() {

		if($("#txtCloseNm").val() == "") {
			toastr.options.positionClass = "toast-top-full-width";
			toastr.error("<div align='center'><b>" + msg04 + "</b></div>", null);
			return false;
		}
		bootbox.confirm("페쇄 신청을 하시겠습니까? 작성된 게시판 글이 전부 사라집니다.", function(result) {
			if(result) {
				param.fcComtId			= fcComtId;
				param.closeTitle			= $("#txtCloseNm").val();
				param.closeComment	= $("#txtCloseComment").val();
				param.sendAll				= $("input[name=sendAll]").val();

				$.ajax({
					dataType: "json",
					type: "POST",
					url: "./insertComtInfoBasicClose",
					data: param,
					success: function(data) {
						$(location).prop('href', './comtMain');
						return;
					}
				});

			}
		});
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
							<th>가입처리</th>
							<th>운영자구분</th>
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
								<label for="closeTitle" class="control-label">페쇄 이유</label>
							</div>
							<div class="col-md-9">
								<input type="text" class="form-control" id="txtCloseNm" name="closeTitle" data-validate="maxlength[100]" value="" />
							</div>
						</div>
					</div>
					<div class="row">
						<p>
							<div class="form-group">
								<div class="col-md-2">
									<label for="closeCommentt" class="control-label">페쇄 상세 사유</label>
								</div>
								<div class="col-md-9">
									<textarea class="form-control" id="txtCloseComment" rows="5" name="closeComment" data-validate="maxlength[300]"></textarea>
								</div>
								<div class="form-group-separator"></div>
							</div>
						</p>
					</div>
					<div class="row">
						<p>
							<div class="form-group">
								<div class="col-md-2">
									<label for="sendAll" class="control-label">전체 공지</label>
								</div>
								<div class="col-md-9">
									<input type="checkbox" class="iswitch iswitch-secondary" name="sendAll" id="chkSendAll" value="Y">
								</div>
								<div class="form-group-separator"></div>
							</div>
						</p>
					</div>
					<div class="row">
						<p>
							<div class="form-group text-right">
								<button class="btn btn-secondary btn-icon" id="closeIfSave">신청</button>
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
								<label for="mailTitle" class="control-label">알림 제목</label>
							</div>
							<div class="col-md-9">
								<input type="text" class="form-control" id="txtMailTitle" name="mailTitle" maxlength="100" value="" />
							</div>
						</div>
					</div>
					<div class="form-group-separator"></div>
					<div class="row">
						<p>
							<div class="form-group">
								<div class="col-md-2">
									<label for="mailText" class="control-label">알림 내용</label>
								</div>
								<div class="col-md-9">
									<textarea class="form-control ckeditor" id="txtMailText" name="mailText" rows="10"></textarea>
								</div>
							</div>
						</p>
					</div>
					<div class="row">
						<p>
							<div class="form-group text-right">
								<button class="btn btn-secondary btn-icon" id="sendIfSave">Save changes</button>
								<button class="btn btn-gray btn-icon" id="sendIfCanse">Canse</button>
							</div>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>