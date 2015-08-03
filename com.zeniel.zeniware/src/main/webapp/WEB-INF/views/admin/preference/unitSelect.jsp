<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">조직관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="../preference/codeMain">환경설정</a></li>
			<li class="active"><strong>조직관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">

	<div class="col-sm-12">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">회사 선택</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-gray btn-sm" id="btnUnitMan">부서/사용자 관리</button>
						<button class="btn btn-white btn-sm" id="btnClosedDept">폐쇄부서 관리</button>
						<button class="btn btn-gray btn-sm" id="btnDeletedUser">퇴직자 관리</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblComp" class="table table-small-font table-striped table-hover">
					<thead>
						<tr>
							<th>회사명</th>
							<th>회사ID</th>
							<th>정렬순서</th>
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
			ajax: { "url": "../ajax/getComplist", "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
      	{ "mData": "compName" }, 
      	{ "mData": "compId" }, 
      	{ "mData": "sortOrder" }, 
      	{ "mData": "regDate" }, 
      	{ "mData": "modDate" }, 
      	{ "mData": "delDate" }
      ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		$('#tblComp tbody').on('click', 'tr', function() {
			$('#tblComp').DataTable().$('tr.selected').removeClass('selected');
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');
		});
		
		/* 부서/사용자관리 */
		$('#btnUnitMan').on('click', function() {
			var selData = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selData.length == 0) {
				toastr.error("<div align='center'><b>" + msg01 + "</b></div>", null);
			} else {
				console.log(selData[0].compId);
				$(location).prop('href', './unitMain?compId=' + selData[0].compId);
			}
		});
		
		/* 폐쇄부서관리 */
		$('#btnClosedDept').on('click', function() {
			var selData = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selData.length == 0) {
				toastr.error("<div align='center'><b>" + msg01 + "</b></div>", null);
			} else {
				console.log(selData[0].compId);
				$(location).prop('href', './unitClosedDept?compId=' + selData[0].compId);
			}
		});
		
		/* 퇴직자관리 */
		$('#btnDeletedUser').on('click', function() {
			var selData = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selData.length == 0) {
				toastr.error("<div align='center'><b>" + msg01 + "</b></div>", null);
			} else {
				$(location).prop('href', './unitResignedUser?compId=' + selData[0].compId);
			}
		});

	});

/* ***References***
	
*/

</script>