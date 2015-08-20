<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<h1 class="title">개설전체 커뮤니티</h1>
		<p class="description">Dynamic table variants with pagination and other controls</p>
	</div>
	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="${pageContext.request.contextPath}/admin/"><i class="fa-home"></i>Home</a></li>
			<li><a href="#">Community</a></li>
			<li class="active"><strong>Basic Setup</strong></li>
		</ol>
	</div>
</div>
<div class="panel panel-default">
	<div class="panel-body">
		<table id="cumtAll" class="table table-small-font table-striped table-bordered">
			<thead>
				<tr>
					<th class="no-sorting"><input type="checkbox" class="cbr"></th>
					<th>개설신청ID</th>
					<th>커뮤니티제목</th>
					<th>신청자</th>
					<th>신청일</th>
					<th>커뮤니티소개</th>
					<th>상태</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	/* Modal Dialog Config */
	$("#modl h4").html("커뮤니티 개설신청 승인");
	$("#modlBody").html("승인 처리하시겠습니까?");
	$("#mod2 h4").html("커뮤니티 개설신청 반려");
	$("#mod2Body").html("반려 하시겠습니까?");
	$("#btnOk").html("승인");
	$("#btnCancel").html("취소");
	$("#btnOk2").html("반려");
	$("#btnCancel2").html("취소");

	var table = $('#cumtAll').DataTable({
//		ajax: {"url": "../community/getCumtAllListData?compId="+${compId}, "dataSrc": ""},
		ajax: {"url": "../community/getCumtAllListData?compId=001", "dataSrc": ""},
		deferRender: true,
		pagingType: "simple_numbers",
		aoColumns: [
			{ "mRender": function(data, type, full) { return '<input type="checkbox" class="cbr">'; } },
			{ "mData": "fcComtId", "visible" : false },
			{ "mData": "cumtNm" },
	      	{ "mData": "regUserId" },
	      	{ "mData": "regDate" },
	      	{ "mData": "cumtComment" },
	      	{ "mData": "admActYn" , "mRender" : function(data,type, full){
				if(data == 'Y') {
					return "사용중";
				} else if(data == 'N') {
					return "승인대기";
				} else if(data == 'P') {
					return "페쇄";
				} else if(data == 'D') {
					return "반려";
				} 
			}
		},
		],
		//sDom: "<'row'<'col-sm-4'<'pull-left'T>><'col-sm-6'f><'col-sm-2'<'pull-right'l>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>",
		sDom: "<'row'<'col-sm-6'<'pull-left'T>><'col-sm-6'<'pull-right'f>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
	});

	// 개설신청 반려 Button OnClick Event
	$("#btnOk2").on('click', function() {
		if ($(this).hasClass("deleteCumt")) {
			$.ajax({
				dataType: "json", 
				type: "POST", 
				url: "./deleteCumtAdmlist", 
				data: { cumtlist: createJsonCumtlist() }, 
				success: function(data) {
					$("#mod2").modal("hide");
					table.rows(".selected").remove().draw(false);
				}
			});
		}
	});

	// 개설신청 수락  Button OnClick Event
	$("#btnOk").on('click', function() {
		if ($(this).hasClass("updateCumt")) {
			$.ajax({
				dataType: "json", 
				type: "POST", 
				url: "./updateCumtAdmlist", 
				data: { cumtlist: createJsonCumtlist() },
				success: function(data) {
					$("#modl").modal("hide");
					table.rows(".selected").remove().draw(false);
				}
			});
		}
	});

	function createJsonCumtlist() {
		var jsonObj = [];

		$("#cumtAll tbody tr").each(function() {
			var chked = $("input[type='checkbox']:checked", this).length;
			
			if (chked == 1) {
				var aTable = $('#cumtInfo').dataTable();
				var pos = aTable.fnGetPosition(this);
//				var data = aTable.fnGetData(pos).fcBoardId;
				var jsonItem = {};
				jsonItem["fcComtId"] = aTable.fnGetData(pos).fcComtId;
				jsonItem["compId"] = "${compId}";
				
				jsonObj.push(jsonItem);
			}
		});
		
		return JSON.stringify(jsonObj);
	}

	// Checkbox OnChange Event
	$("#cumtAll tbody").on('change', "tr td:first-child input[type='checkbox']", function() {
			if ($(this).is(':checked'))
				$(this).parents('tr').addClass('selected');
			else
				$(this).parents('tr').removeClass('selected');
	});

	var $state = $("#cumtInfo thead input[type='checkbox']");
	$("#cumtAll").on('draw.dt', function() {
		cbr_replace();
		$state.trigger('change');
	});

	$state.on('change', function(ev) {
		var $chcks = $("#cumtAll tbody input[type='checkbox']");
		if ($state.is(':checked')) {
			$chcks.prop('checked', true).trigger('change');
		} else {
			$chcks.prop('checked', false).trigger('change');
		}
	});

	function getCumtCount() {
		var cnt = 0;
		$("#cumtAll tbody tr").each(function() {
			cnt+= $("input[type='checkbox']:checked", this).length;
		})
		return cnt;
	}
});
</script>