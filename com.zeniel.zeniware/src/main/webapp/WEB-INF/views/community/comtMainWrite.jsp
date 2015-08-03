<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title" style="padding:10px 0 !important;">
	<div class="title-env">
		<h1 class="title">커뮤니티 생성</h1>
	</div>
	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="${pageContext.request.contextPath}/"><i class="fa-home"></i>Home</a></li>
			<li><a href="./comtMain">Community</a></li>
		</ol>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var msg01 = "생성할 커뮤니티 명을 입력하셔야 합니다.";
	var msg02 = "커뮤니티 상세소개를 입력하셔야 합니다.";

	/* Modal Dialog Config */
	$("#modl h4").html("커뮤니티 신청이 완료 되었습니다.");
	$("#modlBody").html("승인 처리하시겠습니까?");

	$("#btnSave").click(function() {
		if($("#cumtNm").val() == "") {
			alert("호출");
			toastr.options.closeButton = true;
			toastr.options.positionClass = "toast-top-full-width";
			toastr.error("<div align='center'><b>" + msg01 + "</b></div>", null);
			return false;
		}
		if($("#cumtComment").val() == "") {
			toastr.options.closeButton = true;
			toastr.options.positionClass = "toast-top-full-width";
			toastr.error("<div align='center'><b>" + msg02 + "</b></div>", null);
			return false;
		}

		sendComtInfo();
		return false;
	});
	$("#btnCanse").click(function() {
		$(location).prop('href', './comtMain');
		return false;
	});
	$("#sendOk").click(function() {
		$(location).prop('href', './comtMain');
		return false;
	});
});

function sendComtInfo() {
	var msg03 = "중복된 커뮤니티 명입니다. 다른 명으로 신청해 주세요.";
	var msg04 = "커뮤니티 신청이 잘못 되었습니다. 다시 신청해 주세요.";

	var param = {};
	param.cumtNm		= $("#cumtNm").val();
	param.cumtComment	= $("#cumtComment").val();
	param.openYn		= $("input[name=openYn]").val();
	$.ajax({
		dataType: "json",
		type: "POST",
		url: "./getComtInfoCnt",
		data: param,
		success: function(data) {
			if(data > 0) {
				//jQuery('#comtModal2').modal('show', {backdrop: 'static'});
				toastr.options.closeButton = true;
				toastr.options.positionClass = "toast-top-full-width";
				toastr.error("<div align='center'><b>" + msg03 + "</b></div>", null);
				return false;
			} else {
				$.ajax({
					dataType: "json",
					type: "POST",
					url: "./writeComtMainBasic",
					data: param,
					success: function(data) {
						if(data == 0) {
							toastr.options.closeButton = true;
							toastr.options.positionClass = "toast-top-full-width";
							toastr.error("<div align='center'><b>" + msg04 + "</b></div>", null);
							return false;
						} else {
							jQuery('#comtModal').modal('show', {backdrop: 'static'});
							return false;
						}
					}
				});
			}
		}
	});
}

function resend(num) {
	return num;
}
</script>

<form role="form" class="validate form-horizontal" id="form" method="POST">
<!-- <div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="field-1">커뮤니티 명</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="comtNm" name="comtNm" placeholder="Placeholder" />
					</div>
					<div class="col-sm-2">
						<span class="title">커뮤니티 명</span>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="comtNm" name="comtNm" value="">
					</div>
				</div>
			</div>
		</div>
	</div>
</div> -->

<div class="panel panel-default">
	<div class="panel-body">
		<div class="form-group">
			<div class="row">
				<div class="col-sm-2">
					<span class="title">커뮤니티 명</span>
				</div>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="cumtNm" name="cumtNm" maxlength="100" placeholder="Could be used also as Motivation Letter">
				</div>
			</div>
		</div>
		<div class="form-group-separator"></div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-2">
					<span class="title">커뮤니티 상세소개</span>
				</div>
				<div class="col-sm-10">
					<textarea class="form-control autogrow" name="cumtComment" id="cumtComment" rows="5" placeholder="Could be used also as Motivation Letter"></textarea>
				</div>
			</div>
		</div>
		<div class="form-group-separator"></div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-2">
					<span class="title">공개유무</span>
				</div>
				<div class="col-sm-10">
					<div class="form-block">
						<label>
							<input type="radio" name="openYn" value="Y" class="cbr cbr-success" checked>
							공개
						</label>
						<label>
							<input type="radio" name="openYn" value="N" class="cbr cbr-success">
							비공개
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group-separator"></div>
		<div class="form-group text-right">
			<button class="btn btn-primary btn-icon" id="btnSave">Save changes</button>
			<button class="btn btn-gray btn-icon" id="btnCanse">Canse</button>
		</div>
	</div>
</div>
</form>

<!-- Confirm to Close Modal -->
<div class="modal fade" id="comtModal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				커뮤니티 신청이 완료 되었습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="sendOk" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>