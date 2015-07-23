<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">부서/사용자관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="../preference/codeMain">환경설정</a></li>
			<li><a href="../preference/unitSelect">조직관리</a>
			<li class="active"><strong>부서/사용자관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">
	<div class="col-sm-4">
	
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<h3 class="panel-title">조직도 목록</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-gray btn-sm" id="btnGroupAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnGroupEdit">변경</button>
						<button class="btn btn-gray btn-sm" id="btnGroupDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<div class="scrollable" data-max-height="500">
					<div id="jstree_demo_div"></div>
				</div>
			</div>
		</div>
	
	</div>
	
	<div class="col-sm-8">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">부서원 관리</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-gray btn-sm" id="btnUserAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnUserEdit">변경</button>
						<button class="btn btn-gray btn-sm" id="btnUserDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblUser" class="table table-small-font table-striped table-hover">
					<thead>
						<tr>
							<th>성명</th>
							<th>ID</th>
		 					<th>직위</th>
							<th>메일</th>
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
		var paramDeptId = "${deptId}";
		
		var msg01 = "검색어를 입력하세요.";
		var msg02 = "부서를 먼저 선택하세요.";
		
		toastr.options.closeButton = true;
		toastr.options.positionClass = "toast-top-full-width";
		
		/* jsTree Data Binding */
		$("#jstree_demo_div").jstree({
			"core": {
				"data": { 
					url: "../ajax/getNodelist", 
					data: { compId: paramCompId }
				}
			}
		});
		
		/* jsTree Node Click */
		$("#jstree_demo_div").on('changed.jstree', function(e, data) {
			var i, j, r = [];
			
			for (i = 0, j = data.selected.length; i < j; i++) {
				r.push(data.instance.get_node(data.selected[i]).text);
			}
			
			var curCompId = data.selected[0].substr(0, 3);
			var curDeptId = data.selected[0].substr(3, 4);
			
			if ($('.dataTables_filter input').val().length > 0) {
				$('#tblUser').DataTable().search("").draw();
			}
			
			$('#tblUser').DataTable().ajax.url('../ajax/getUserlist?compId=' + curCompId + '&deptId=' + curDeptId).load();			
		});
		
		/* userlist Data Binding */
		$('#tblUser').DataTable({
			ajax: { "url": "../ajax/getUserlist", "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
      	{ "mData": "userName" }, 
      	{ "mData": "userId" }, 
      	{ "mData": "jobTitleCode" }, 
      	{ "mData": "mailId" }
      ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		/* 사용자 선택 */
		$("#tblUser tbody").on('click', 'tr', function() {
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');
		});
		
		/* 사용자 검색 */
		$('.dataTables_filter input').unbind().keyup(function(e) {
			if (e.keyCode == 13) {
				if ($(this).val().length == 0) {
					toastr.error("<div align='center'><b>" + msg01 + "</b></div>", null);
				} else {
					var strUrl = '../ajax/getUserlist?compId=' + paramCompId + '&keyword=' + $(this).val();
					$('#tblUser').DataTable().ajax.url(strUrl).load();
				}
			}
		});
		
		/* 사용자 추가 */
		$('#btnUserAdd').on('click', function() {
			var selNode = $('#jstree_demo_div').jstree('get_selected');
			
			if (selNode.length == 0) {
				toastr.error("<div align='center'><b>" + msg02 + "</b></div>", null);
			} else {
				var selCompId = selNode[0].substr(0, 3);
				var selDeptId = selNode[0].substr(3, 4);
				var selDeptName = $('#' + selNode[0]).text();
				
				$(location).prop('href', 'unitAddUser?compId=' + selCompId + '&deptId=' + selDeptId + '&deptName=' + selDeptName);
			}
		});

	});

/* ***References***
	How to get value entered in search box in Datatables: 
		http://stackoverflow.com/questions/26590778/how-to-get-value-entered-in-search-box-in-datatables
*/

</script>