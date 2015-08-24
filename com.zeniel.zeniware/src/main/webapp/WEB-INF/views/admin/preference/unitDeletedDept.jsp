<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">삭제부서관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="./codeMain">환경설정</a></li>
			<li><a href="./unitSelect">조직관리</a>
			<li class="active"><strong>삭제부서관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">

	<div class="col-sm-12">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">삭제부서 목록</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-white btn-sm" id="btnRestore">복원</button>
						<button class="btn btn-white btn-sm" id="btnDelete">완전삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblDept" class="table table-small-font table-striped table-hover">
					<thead>
						<tr>
							<th>부서명</th>
							<th>부서ID</th>
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
		var prmCompId = "${compId}";
		var contextPath = "${pageContext.request.contextPath}";
		
		$('#tblDept').DataTable({
			ajax: { "url": "../ajax/getDeptlist?mode=-1&compId=" + prmCompId, "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
      	{ "mData": "deptName" }, 
      	{ "mData": "deptId" },  
      	{ "mData": "regDate" }, 
      	{ "mData": "modDate" }, 
      	{ "mData": "delDate" }
      ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		$("#tblDept tbody").on('click', 'tr', function() {
			$("#tblComp").DataTable().$('tr.selected').removeClass('selected');
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');
		});
		
		$("#btnRestore").on('click', function() {
			$.get(contextPath + '/modal/admin/deptTree', function(data) {
				modalToggle(true, data, '상위부서 선택');
			});
		});

	});

/* ***References***
	
*/

</script>