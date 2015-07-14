<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<h1 class="title">커뮤니티 기본설정</h1>
		<p class="description">Dynamic table variants with pagination and other controls</p>
	</div>
	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="dashboard-1.html"><i class="fa-home"></i>Home</a></li>
			<li><a href="tables-basic.html">Community</a></li>
			<li class="active"><strong>Basic Setup</strong></li>
		</ol>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var sizeyn = "${cmutBasic.FILE_SIZE_YN}";
	var addyn = "${cmutBasic.FILE_ADD_YN}";
	if(sizeyn == 'Y') {
		$('#sizeNum').show();
	} else {
		$('#sizeNum').hide();
	}
	if(addyn == 'Y') {
		$('#attachNum').show();
	} else {
		$('#attachNum').hide();
	}
	//파일용량 라디오버튼
	var $state = $('input[name=fileSizeYn]');
	$state.on('change', function(ev) {
		if($("#FlSizeYn1").is(':checked')) {
			$('#sizeNum').hide();
		} else {
			$('#sizeNum').show();
		}
	});

	//파일 갯수제한 라디오버튼
	var $state2 = $('input[name=fileAddYn]');
	$state2.on('change', function(ev) {
		if($("#FlAddYn1").is(':checked')) {
			$('#attachNum').hide();
		} else {
			$('#attachNum').show();
		}
	});

	$("#editIcon").click(function() {
		repeatSizeEvent($(this));
	});
	$("#editAddIcon").click(function() {
		repeatEvent($(this));
	});

	$("#btnSave").click(function() {
		var srtCk = isNumber($("#sizeFiled").val());
		var frch = isNumber($("#fileAddFiled").val());
		if(srtCk == false) {
			repaetNum();
			return false;
		}
		if(frch == false) {
			repeatNum();
			return false;
		}
		$("#form1").prop('action', 'editBasic').submit();
	});
});

function repeatSizeEvent(ev) {
	var fileSize = "${cmutBasic.FILE_SIZE}";
	var $chcks = $("#sizeNum");
	$chcks.empty();
	var rHtm = "<input type='text' style='width:60px;' data-validate='number' name='fileSize' value='" + fileSize + "' onBlur='repaetNum();' id='sizeFiled' /><span id='fszdMt'></span> MB 이하<span id='faddMt'></span>";
	$chcks.html(rHtm);
}

function repeatEvent(ev) {
	var fileAdd = "${cmutBasic.FILE_ADD_CNT}";
	var $chcks = $("#attachNum");
	$chcks.empty();
	var rHtm = "<input type='text' style='width:60px;' data-validate='number' name='fileAddCnt' value='" + fileAdd + "' onBlur='repeatNum();' id='fileAddFiled' /> 개 이하<span id='srtMt'></span>";
	$chcks.html(rHtm);
}

function repaetNum() {
	var filder = isNumber($("#sizeFiled").val());
	var rHm = "";
	if(filder == false) {
		rHm = "<br />" + "Please enter a valid number.";
		$("#faddMt").html(rHm);
	} else {
		$("#faddMt").html('');
	}
}

function repeatNum() {
	var filder = isNumber($("#fileAddFiled").val());
	var rHm = "";
	if(filder == false) {
		rHm = "<br />" + "Please enter a valid number.";
		$("#srtMt").html(rHm);
	} else {
		$("#srtMt").html('');
	}
}

function isNumber(value) {
	var result = true;
	for(j = 0; result && (j < value.length); j++) {
		if((value.substring(j, j+1) < "0") || (value.substring(j, j+1) > "9")) {
			result = false;
		}
	}
	return result;
}
</script>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" class="validate form-horizontal" id="form1" method="POST">
					<input type="hidden" name="fcAdmSeq" value='<c:out value="${cmutBasic.FC_ADM_SEQ}" />' />
					<input type="hidden" name="compId" value='<c:out value="${cmutBasic.COMP_ID}" />' />
					<table class="table responsive">
						<colgroup>
							<col width="130" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th>개설방식</th>
								<td>
									<div class="col-sm-10">
										<input type="radio" name="cumtType" class="cbr cbr-blue" value="N" <c:if test="${cmutBasic.CUMT_TYPE == 'N'}">checked</c:if>>
										<label>관리자 승인 후 개설</label>
										<br />
										<input type="radio" name="cumtType" class="cbr cbr-danger" value="Y" <c:if test="${cmutBasic.CUMT_TYPE == 'Y'}">checked</c:if>>
										<label>관리자 승인 없이 개설</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>파일 용량제한<br/>(파일1개)</th>
								<td>
									<div class="col-sm-10">
										<input type="radio" id="FlSizeYn1" name="fileSizeYn" class="cbr cbr-blue" value="N" <c:if test="${cmutBasic.FILE_SIZE_YN == 'N'}">checked</c:if>>
										<label>제한없음</label>
										<br />
										<input type="radio" id="FlSizeYn2" name="fileSizeYn" class="cbr cbr-danger" value="Y" <c:if test="${cmutBasic.FILE_SIZE_YN == 'Y'}">checked</c:if>>
										<label>개수제한</label>
										&nbsp;
										<span id="sizeNum" style="display:;">
											<c:out value="${cmutBasic.FILE_SIZE}" />&nbsp;&nbsp;<i id="editIcon" class="fa fa-file-text">&nbsp;</i>
											<input type="hidden" style=""width:60px;" name="fileSize" value="${cmutBasic.FILE_SIZE}" id="sizeFiled" />
											MB 이하 
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th>파일 개수제한<br/>(게시물당)</th>
								<td>
									<div class="col-sm-10">
										<input type="radio" id="FlAddYn1" name="fileAddYn" class="cbr cbr-blue" value="N" <c:if test="${cmutBasic.FILE_ADD_YN == 'N'}">checked</c:if>>
										<label>제한없음</label>
										<br />
										<input type="radio" name="fileAddYn" class="cbr cbr-danger" value="Y" <c:if test="${cmutBasic.FILE_ADD_YN == 'Y'}">checked</c:if>>
										<label>개수제한</label>
										&nbsp;
										<span id="attachNum" style="display:;">
											<c:out value="${cmutBasic.FILE_ADD_CNT}" />&nbsp;&nbsp;<i id="editAddIcon" class="fa fa-file-text">&nbsp;</i>
											<input type="hidden" style="width:60px;" name="fileAddCnt" value="${cmutBasic.FILE_ADD_CNT}" id="fileAddFiled" />
											개 이하
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th>업로드 불가 파일</th>
								<td>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="field-1" name="fileNotName" value="<c:out value="${cmutBasic.FILE_NOT_NAME}" />">
										※ 업로드를 제한할 파일의 확장자를 ,(쉼표)로 구분해서 등록해주세요. 
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="form-group text-right">
						<button class="btn btn-primary" id="btnSave">Save changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
