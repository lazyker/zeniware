<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">삭제회사관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="./codeMain">환경설정</a></li>
			<li><a href="./unitSelect">조직관리</a>
			<li class="active"><strong>삭제회사관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">

	<div class="col-sm-12">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">삭제회사 목록</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-white btn-sm" id="btnRestore">복원</button>
						<button class="btn btn-white btn-sm" id="btnDelete">완전삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblComp" class="table table-small-font table-striped table-hover">
					<thead>
						<tr>
							<th>회사ID</th>
							<th>회사명</th>
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
		
		var contextPath = "${pageContext.request.contextPath}";
		
		$('#tblComp').DataTable({
			ajax: { "url": "../ajax/getComplist?mode=-1", "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
      	{ "mData": "compId" }, 
      	{ "mData": "compName" },  
      	{ "mData": "regDate" }, 
      	{ "mData": "modDate" }, 
      	{ "mData": "delDate" }
      ], 
      order: [ [4, "desc"] ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		$("#tblComp tbody").on('click', 'tr', function() {
			$("#tblComp").DataTable().$('tr.selected').removeClass('selected');
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');
		});
		
		$("#btnRestore").on('click', function() {
			var selRow = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selRow.length > 0) {
				bootbox.confirm("복원하시겠습니까?", function(result) {
					if (result) {
						$.ajax({
							dataType: "json", 
							type: "post", 
							url: contextPath + "/admin/ajax/restoreSingleComp", 
							data: { compId: selRow[0].compId }, 
							success: function(data) {
								toastrAlert('success', '복원되었습니다.');
								$('#tblComp').DataTable().rows('.selected').remove().draw(false);
							} 
						});
					}
				});
			} else {
				toastrAlert('error', '복원할 회사를 선택하세요.');
			}
		});
		
		$('#btnDelete').on('click', function() {
			var selRow = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selRow.length > 0) {
				bootbox.confirm("삭제하시겠습니까?", function(result) {
					if (result) {
						$.ajax({
							dataType: "json", 
							type: "post", 
							url: contextPath + "/admin/ajax/deleteSingleComp", 
							data: { mode: "hard", compId: selRow[0].compId }, 
							success: function(data) {
								toastrAlert('success', '삭제되었습니다.');
								$('#tblComp').DataTable().rows('.selected').remove().draw(false);
							}
						});
					}
				});
			} else {
				toastrAlert('error', '삭제할 회사를 선택하세요.');
			}
		});

	});

/* ***References***
	
*/

</script>