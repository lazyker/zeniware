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
			<li class="active"><strong>삭제계정관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">

	<div class="col-sm-12">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">삭제계정 목록</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-white btn-sm" id="btnRestore">복원</button>
						<button class="btn btn-white btn-sm" id="btnDelete">완전삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblUser" class="table table-small-font middle-align table-hover">
					<thead>
						<tr>
							<th class="no-sorting user-cb"><input type="checkbox" class="cbr"></th>
							<th>회사ID</th>
							<th>부서ID</th>
							<th>부서명</th>
							<th>사용자ID</th>
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
		
		var paramCompId = "${compId}";
		
		$('#tblUser').DataTable({
			ajax: {
				'url': './ajax/getUserlist', 
				'data': { compId: paramCompId, resigned: 1 }, 
				'dataSrc': "" 
			}, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
				{ 
					"mRender": function(data, type, full) { return '<input type="checkbox" class="cbr">'; }, 
					"sClass": "user-cb"
				}, 
      	{ "mData": "compId", "visible": false }, 
      	{ "mData": "deptId" }, 
      	{ "mData": "deptName" }, 
      	{ "mData": "userId" }, 
      	{ "mData": "userName" }, 
      	{ "mData": "jobTitleName" }, 
      	{ "mData": "regDate" }, 
      	{ "mData": "modDate" }, 
      	{ "mData": "delDate" }
      ], 
      order: [ [8, "desc"] ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		/* 사용자 정보 */
		$('#tblUser tbody').on('click', 'tr td:not(:first-child)', function() {
			var oTable = $('#tblUser').dataTable();
			var aPos = oTable.fnGetPosition(this);
			var aData = oTable.fnGetData(aPos);
			
 			var sUrl = './modal/userNew';
 			var sUri = '?compId=' + aData.compId + '&userId=' + aData.userId;
			
			$.get(sUrl + sUri, function(data) {
				modalToggle(true, data, '사용자 정보');
			});
		});
		
		/* 사용자 계정 복원 */
		$('#btnRestore').on('click', function() {
			var $checked = $('tbody :checkbox:checked', $('#tblUser'));
			
			if ($checked.length > 0) {
				$.get('./modal/deptTree?opener=restoreuser', function(data) {
					modalToggle(true, data);
				});
			} else {
				toastrAlert('error', '복원할 사용자 계정을 선택하세요.');
			}
		});
		
		/* 사용자 계정 삭제(Hard Delete) */
		$('#btnDelete').on('click', function() {
			var $checked = $('tbody :checkbox:checked', $('#tblUser'));

 			if ($checked.length > 0) {
 				bootbox.confirm('선택된 계정을 삭제하시겠습니까? 삭제한 계정은 복원할 수 없습니다.', function(result) {
 					if (result) {
 						$.ajax({
 							dataType: 'json', 
 							type: 'post', 
 							url: './ajax/deleteUserList', 
 							data: { mode: 'hard', userlist: createJsonUserlist() }, 
 							success: function(data) {
 								toastrAlert('success', data + '개의 사용자 계정이 삭제되었습니다.');
 								$('#tblUser').DataTable().ajax.reload(null, false);
 							}
 						});
 					}
 				});
 			} else {
 				toastrAlert('error', '삭제할 사용자 계정을 선택하세요.');
 			}
		});
		
		/* 사용자 json object 생성 */
		var createJsonUserlist = function() {
			var jsonObj = [];
			var oTable = $('#tblUser').dataTable();
			
			$('input:checked', oTable.fnGetNodes()).each(function(i) {
				var jsonItem = {};
				var aData = oTable.fnGetData(i);
				
				jsonItem['compId'] = aData.compId;
				jsonItem['userId'] = aData.userId;
				
				jsonObj.push(jsonItem);
			});

			return JSON.stringify(jsonObj);
		};
				
	});

/* ***References***
	
*/

</script>