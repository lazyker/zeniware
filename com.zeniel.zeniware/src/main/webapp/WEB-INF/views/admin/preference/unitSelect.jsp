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
						<button class="btn btn-white btn-sm" id="btnUnitMan">부서/사용자 관리</button>
						<button class="btn btn-white btn-sm" id="btnDeletedComp">삭제회사 관리</button>
						<button class="btn btn-white btn-sm" id="btnDeletedDept">삭제부서 관리</button>
						<button class="btn btn-white btn-sm" id="btnDeletedUser">삭제계정 관리</button>
						<button class="btn btn-white btn-sm" id="btnCompAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnCompEdit">변경</button>
						<button class="btn btn-white btn-sm" id="btnCompDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblComp" class="table table-small-font table-striped table-hover">
					<thead>
						<tr>
							<th>회사ID</th>
							<th>회사명</th>
							<th>사용여부</th>
		 					<th>생성일</th>
		 					<th>변경일</th>
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
			ajax: { "url": contextPath + "/admin/ajax/getComplist?mode=0", "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
				{ "mData": "compId" }, 
      	{ "mData": "compName" }, 
      	{ "mData": "activateYn" }, 
      	{ "mData": "regDate" }, 
      	{ "mData": "modDate" }
      ], 
      order: [ [3, "desc"] ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		$('#tblComp tbody').on('click', 'tr', function() {
			$('#tblComp').DataTable().$('tr.selected').removeClass('selected');
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');
		});
		
		/* 회사 추가 */
		$('#btnCompAdd').on('click', function() {
			$.get(contextPath + '/modal/admin/compNew', function(data) {
				modalToggle(true, data);
			});
		});
		
		/* 회사 변경 */
		$('#btnCompEdit').on('click', function () {
			var selRow = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selRow.length == 0) {
				toastrAlert('error', '회사를 선택하세요.');
			} else {
				$.get(contextPath + '/modal/admin/compNew?compId=' + selRow[0].compId, function(data) {
					modalToggle(true, data, '회사 변경');
				});
			}
		});
		
		/* 회사 삭제 */
		$('#btnCompDelete').on('click', function() {
			var selRow = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selRow.length > 0) {
				bootbox.confirm("삭제하시겠습니까?", function(result) {
					if (result) {
						$.ajax({
							dataType: "json", 
							type: "post", 
							url: contextPath + "/admin/ajax/deleteSingleComp", 
							data: { mode: 'soft', compId: selRow[0].compId }, 
							success: function(data) {
								toastrAlert('success', '삭제되었습니다.');
								$('#tblComp').DataTable().rows(".selected").remove().draw(false);
							} 
						});
					}
				});
				
			} else {
				toastrAlert('error', '삭제할 회사를 선택하세요.');
			}
		});
		
		/* 부서/사용자관리 */
		$('#btnUnitMan').on('click', function() {
			var selData = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selData.length == 0) {
				toastrAlert('error', '회사를 선택하세요.');
				
			} else {
				$(location).prop('href', contextPath + '/admin/preference/unitMain?compId=' + selData[0].compId);
			}
		});
		
		/* 삭제회사관리 */
		$('#btnDeletedComp').on('click', function() {
			$(location).prop('href', contextPath + '/admin/preference/unitDeletedComp');
		});
		
		/* 삭제부서관리 */
		$('#btnDeletedDept').on('click', function() {
			var selData = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selData.length == 0) {
				toastrAlert('error', '회사를 선택하세요.');
				
			} else {
				console.log(selData[0].compId);
				$(location).prop('href', contextPath + '/admin/preference/unitDeletedDept?compId=' + selData[0].compId);
			}
		});
		
		/* 삭제계정관리 */
		$('#btnDeletedUser').on('click', function() {
			var selData = $('#tblComp').DataTable().rows('.selected').data();
			
			if (selData.length == 0) {
				toastrAlert('error', '회사를 선택하세요.');
				
			} else {
				$(location).prop('href', contextPath + '/admin/preference/unitResignedUser?compId=' + selData[0].compId);
			}
		});

	});

/* ***References***

*/

</script>