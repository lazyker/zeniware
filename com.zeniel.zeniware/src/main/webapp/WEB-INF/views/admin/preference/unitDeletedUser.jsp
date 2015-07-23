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
						<button class="btn btn-gray btn-sm">복원</button>
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
		
		var msg01 = "회사를 선택하세요.";
		
		toastr.options.closeButton = true;
		toastr.options.positionClass = "toast-top-full-width";
		
		$('#tblComp').DataTable({
			ajax: { "url": "../ajax/getDeletedUserlist", "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
      	{ "mData": "compId" }, 
      	{ "mData": "deptId" }, 
      	{ "mData": "deptName" }, 
      	{ "mData": "jobTitleCd" }, 
      	{ "mData": "regDate" }, 
      	{ "mData": "modDate" }, 
      	{ "mData": "delDate" }
      ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		$("#tblComp tbody").on('click', 'tr', function() {
			$("#tblComp").DataTable().$('tr.selected').removeClass('selected');
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');
		});
		
		$("#btnUnitMan").on('click', function() {
			var selData = $("#tblComp").DataTable().rows(".selected").data();
			
			if (selData.length == 0) {
				toastr.error("<div align='center'><b>" + msg01 + "</b></div>", null);
			} else {
				console.log(selData[0].compId);
				$(location).prop('href', 'unitMain?compId=' + selData[0].compId);
			}
		});

	});

/* ***References***
	
*/

</script>