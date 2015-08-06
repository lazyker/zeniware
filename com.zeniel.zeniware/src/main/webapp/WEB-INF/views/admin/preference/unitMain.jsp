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
						<button class="btn btn-gray btn-sm" id="btnDeptAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnDeptEdit">변경</button>
						<button class="btn btn-gray btn-sm" id="btnDeptDelete">삭제</button>
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
			
			<div class="panel-body" id="divTable">
				<table id="tblUser" class="table table-small-font middle-align table-hover">
					<thead>
						<tr>
							<th class="no-sorting hidden-xs hidden-sm"></th>
							<th>회사ID</th>
							<th>부서명</th>
							<th>성명</th>
							<th>ID</th>
		 					<th>직위</th>
							<th class="hidden-xs hidden-sm">메일</th>
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
		
		var msg01 = "검색어를 입력하세요.";
		var msg02 = "부서를 먼저 선택하세요.";
		var msg03 = "편집할 사용자를 선택하세요.";
		var msg04 = "사용자를 한 명만 선택하세요.";
		
		/* jsTree Data Binding */
		$("#jstree_demo_div").jstree({
			"core": {
				"multiple": false, 
				"check_callback": function(op, node, par, pos, more) {
					if (op == 'move_node') {
						if (more && more.core) {
							if (confirm('옮기시겠습니까?')) {
								return true;
							}
						} else {
							return true;
						}
					}
					
					return false;
				}, 
				"data": { 
					url: "../ajax/getNodelist", 
					data: { compId: paramCompId }
				}
			}, 
			"dnd": {
				"drop_finish": function() {
					console.log('dropped!!!');
				}
			}, 
			"plugins": [ "dnd" ] 
		});
		
		/* userlist Data Binding */
		var tbl = $('#tblUser').DataTable({
			ajax: { "url": "../ajax/getUserlist", "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers",  
			aoColumns: [
				{ "mRender": function(data, type, full) { return rendering(data, type, full); } }, 
				{ "mData": "compId", "visible": false }, 
        { "mData": "deptName" }, 
      	{ "mData": "userName" }, 
      	{ "mData": "userId" }, 
      	{ "mData": "jobTitleName" }, 
      	{ "mData": "mailId" }
      ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>" 
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
			
			tbl.ajax.url('../ajax/getUserlist?compId=' + curCompId + '&deptId=' + curDeptId + '&resigned=0').load();			
		});
		
		/* 부서 추가 */
		$('#btnDeptAdd').on('click', function() {
			var selNode = $('#jstree_demo_div').jstree(true).get_selected('full', true);
			
			if (selNode.length == 0) {
				toastrAlert('error', '부서를 선택하세요.');
				
			} else {
				var selCompId = selNode[0].id.substr(0, 3);
				var selDeptId = selNode[0].id.substr(3, 4);
				var selDeptName = selNode[0].text;
				
				$.get('./unitNewDept?compId=' + selCompId + '&prtDeptId=' + selDeptId + '&prtDeptName=' + selDeptName, function(data) {
					modalInit(true, '부서 추가', data, '확인', '취소');
				});
			}
		});
		
		/* 부서 변경 */
		$('#btnDeptEdit').on('click', function() {
			var selNode = $('#jstree_demo_div').jstree(true).get_selected('full', true);
			
			if (selNode.length == 0) {
				toastrAlert('error', '부서를 선택하세요.');
				
			} else {
				var selCompId = selNode[0].id.substr(0, 3);
				var selDeptId = selNode[0].id.substr(3, 4);
				
				$.get('./unitNewDept?compId=' + selCompId + '&deptId=' + selDeptId, function(data) {
					modalInit(true, '부서 변경', data, '확인', '취소');
				});
			}
		});
		
		/* 사용자 선택 */
		$('#tblUser tbody').on('click', 'tr', function() {
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');
		});
		
		/* 사용자 검색 */
		$('.dataTables_filter input').unbind().keyup(function(e) {
			if (e.keyCode == 13) {
				if ($(this).val().length == 0) {
					toastrAlert('error', msg01);
				} else {
					var strUrl = '../ajax/getUserlist?compId=' + paramCompId + '&resigned=0&keyword=' + $(this).val();
					$('#tblUser').DataTable().ajax.url(strUrl).load();
				}
			}
		});
		
		/* 사용자 추가 */
		$('#btnUserAdd').on('click', function() {
			var selNode = $('#jstree_demo_div').jstree('get_selected');
			
			if (selNode.length == 0) {
				toastrAlert('error', msg02);
				
			} else {
				var selCompId = selNode[0].substr(0, 3);
				var selDeptId = selNode[0].substr(3, 4);
				var selDeptName = $('#' + selNode[0]).text();
				
				$(location).prop('href', 'unitNewUser?compId=' + selCompId + '&deptId=' + selDeptId + '&deptName=' + selDeptName);
			}
		});
		
		/* 사용자 변경 */
		$('#btnUserEdit').on('click', function() {
			var selRow = $('#tblUser').DataTable().rows('.selected').data();
			
			if (selRow.length == 0) {				
				toastrAlert('error', msg03);
				
			} else if (selRow.length > 1) {
				toastrAlert('error', msg04);
				
			} else {
				var sUrl = './unitNewUser?compId=' + selRow[0].compId + '&userId=' + selRow[0].userId + '&deptName=' + selRow[0].deptName;
				$(location).attr('href', sUrl);
			}
		});
		
		/* 사용자 삭제(Soft Delete) */
		$('#btnUserDelete').on('click', function() {
			var selRow = $('#tblUser').DataTable().rows('.selected').data();
			
			if (selRow.length > 0) {
				modalInit(true, '사용자 삭제', '삭제하시겠습니까?', '확인', '취소');
				$('#btnOk').addClass('deleteUser');
				
			} else {
				toastrAlert('error', '삭제할 사용자를 선택하세요.');
			}
		});
		
		/* 삭제 진행 */
		$('#btnOk').on('click', function() {
			if ($(this).hasClass("deleteDept")) {
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
						$('#tblUser').DataTable().rows(".selected").remove().draw(false);
					} 
				});
			}
		});
		
		/* 사용자 Json Object 생성 */
		var createJsonUserlist = function() {
			var jsonObj = [];
			
			$('#tblUser').DataTable().rows('.selected').data().each(function(selData) {
				var jsonItem = {};
				
				jsonItem["compId"] = selData.compId;
				jsonItem["userId"] = selData.userId;
				jsonItem["useYn"] = 0;
				
				jsonObj.push(jsonItem);
			});
			
			return JSON.stringify(jsonObj);
		};
		
		/* 사용자 이미지 Rendering... */
		var rendering = function(data, type, full) {
			var result = "";
			
			if (type == 'display') {
				result += "<a href='#'>";
				result += "<img src='${pageContext.request.contextPath}";
				result += "/assets/images/user-3.png' class='img-circle' alt='user-pic' />";
				result += "</a>";
			}
			
			return result;
		};
		
		var c = {};
		
		$('#tblUser tbody').sortable({
			items: "> tr", 
			appendTo: "parent", 
			helper: "clone", 
			start: function(e, ui) {
			}
		}).disableSelection();
		
		/* Draggable & Droppable */

	});

/* ***References***
	How to get value entered in search box in Datatables: 
		http://stackoverflow.com/questions/26590778/how-to-get-value-entered-in-search-box-in-datatables
*/

</script>