<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">퇴직자관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="./codeMain">환경설정</a></li>
			<li><a href="./unitSelect">조직관리</a>
			<li class="active"><strong>퇴직자관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">

	<div class="col-sm-12">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">퇴직자 목록</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-gray btn-sm" id="btnRestore">복원</button>
						<button class="btn btn-white btn-sm">완전삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblUser" class="table table-small-font table-striped table-hover">
					<thead>
						<tr>
							<th>회사ID</th>
							<th>부서ID</th>
							<th>부서명</th>
							<th>성명</th>
							<th>직위</th>
		 					<th>생성일</th>
		 					<th>변경일</th>
							<th>삭제일</th>
						</tr>
					</thead>
				</table>
			</div>
		
		</div>
	
	</div>
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		toastrInit();
		
		var paramCompId = "${compId}";
		
		$('#tblUser').DataTable({
			ajax: {
				"url": "../ajax/getUserlist", 
				"data": { compId: paramCompId, resigned: 1 }, 
				"dataSrc": "" 
			}, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
      	{ "mData": "compId", "visible": false }, 
      	{ "mData": "deptId", "visible": false }, 
      	{ "mData": "deptName" }, 
      	{ "mData": "userName" }, 
      	{ "mData": "jobTitleName" }, 
      	{ "mData": "regDate" }, 
      	{ "mData": "modDate" }, 
      	{ "mData": "delDate" }
      ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		/* 사용자 선택 */
		$('#tblUser tbody').on('click', 'tr', function() {
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');
		});
		
		$('#btnRestore').on('click', function() {
			var selRow = $('#tblUser').DataTable().rows('.selected').data();
			
			if (selRow.length > 0) {
				modalInit(true, '퇴직자 복원', '복원하시겠습니까?', '확인', '취소');
				$('#btnOk').addClass('restoreUser');
				
			} else {
				toastr.error("<div align='center'><b>" + "복원할 사용자를 선택하세요." + "</b></div>", null);
			}
		});
		
		/* button event handler */
		$("#btnOk").on('click', function() {
			if ($(this).hasClass("deleteUser")) {
// 				$.ajax({
// 					dataType: "json", 
// 					type: "POST", 
// 					url: "../ajax/deleteCodelist", 
// 					data: { codelist: createJsonGrouplist() }, 
// 					success: function(data) {
// 						$("#modl").modal("hide");
// 						$("#tblGroup").DataTable().ajax.url('../ajax/getGrouplist').load();
// 					}
// 				});
			} else {
				$.ajax({
					dataType: "json", 
					type: "POST", 
					url: "../ajax/resignUserlist", 
					data: { userlist: createJsonUserlist() }, 
					success: function(data) {
						modalInit(false);
						$("#tblUser").DataTable().rows(".selected").remove().draw(false);
					} 
				});
			}
		});
		
		/* 사용자 Json Object 생성 */
		function createJsonUserlist() {
			var jsonObj = [];
			
			$('#tblUser').DataTable().rows(".selected").data().each(function(selData) {
				var jsonItem = {};
				
				jsonItem["compId"] = selData.compId;
				jsonItem["userId"] = selData.userId;
				jsonItem["useYn"] = 1;
				
				jsonObj.push(jsonItem);
			});
			
			return JSON.stringify(jsonObj);
		}

	});

/* ***References***
	
*/

</script>