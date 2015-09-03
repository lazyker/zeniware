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

<div class="panel panel-default">

	<div class="panel-heading">
		<h3 class="panel-title">회사 선택</h3>
		
		<div class="panel-options">
			<div class="btn-group">
				<button class="btn btn-white btn-sm" id="btnDelComp">삭제회사</button>
				<button class="btn btn-white btn-sm" id="btnCompAdd">추가</button>
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

<script type="text/javascript">

	$(document).ready(function() {
		
		/* Datatable Configuration */
		var table = $('#tblComp').DataTable({
			ajax: { "url": './ajax/getComplist?mode=0', "dataSrc": "" }, 
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
	  	dom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		/* 회사 정보 */
		$('#tblComp tbody').on('click', 'tr', function() {
			var oTable = $('#tblComp').dataTable();
			var aPos = oTable.fnGetPosition(this);
			var aData = oTable.fnGetData(aPos);
			
			$.get('./modal/compNew?compId=' + aData.compId, function(data) {
				modalToggle(true, data, '회사 정보');
			});
		});
		
		/* 삭제회사관리 */
		$('#btnDelComp').on('click', function() {
			$(location).prop('href', './unitDeletedComp');
		});
		
		/* 회사 추가 */
		$('#btnCompAdd').on('click', function() {
			$.get('./modal/compNew', function(data) {
				modalToggle(true, data);
			});
		});

	});

/* ***References***

*/

</script>