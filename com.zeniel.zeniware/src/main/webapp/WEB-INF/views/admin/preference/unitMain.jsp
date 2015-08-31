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
						<button class="btn btn-white btn-sm" id="btnDeptAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnDeptEdit">변경</button>
						<button class="btn btn-white btn-sm" id="btnDeptDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<div class="scrollable" data-max-height="500">
					<div class="custom-jstree" id="jstreeDept"></div>
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
						<button class="btn btn-white btn-sm" id="btnUserMove">부서이동</button>
						<button class="btn btn-white btn-sm" id="btnRelocation">정렬순서</button>
						<button class="btn btn-white btn-sm" id="btnUserAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnUserDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblUser" class="table table-small-font middle-align table-hover">
					<thead>
						<tr>
							<th class="no-sorting user-cb"><input type="checkbox" class="cbr"></th>
							<th class="no-sorting hidden-xs hidden-sm user-image"></th>
							<th>회사ID</th>
							<th>부서명</th>
							<th>성명</th>
							<th>ID</th>
		 					<th>직위</th>
							<th>메일</th>
							<th>정렬순서</th>
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
		
		/* jsTree Data Binding */
		$('#jstreeDept').jstree({
			"core": { 
				"data": { 
					'url': function(node) {
						var curCompId = node.id.substr(1, 3);
						var curDeptId = node.id.substr(4, 4);

						return node.id == '#' ? 
							'../../plugin/ajax/getNodelistDefer?compId=' + prmCompId + '&nodeType=root&resType=D' : 
							'../../plugin/ajax/getNodelistDefer?compId=' + curCompId + '&deptId=' + curDeptId + '&nodeType=child&resType=D';
					}, 
					'data': function(node) {
						return { 'id': node.id };
					}
				}, 
				"check_callback": function(operation, node, parent, position, more) {
					if (operation == 'move_node') {
						if (parent.id != '#') {
							if (more && more.core) {
								if (confirm("이동하시겠습니까?")) {
									return true;
								}
							} else {
								return true;
							}
						}
					} else {
						return true;
					}
					
					return false;
				}, 
				"multiple": false
			}, 
			"plugins": [ "dnd" ] 
		}).on('changed.jstree', function(e, data) {
			data.instance.toggle_node(data.node);
			
			var i, j, r = [];

			if (data.selected.length == 0) {
				$('#tblUser').DataTable().ajax.url('./ajax/getUserlist').load();
			} else {
				for (i = 0, j = data.selected.length; i < j; i++) {
					r.push(data.instance.get_node(data.selected[i]).text);
				}
				
				var curCompId = data.selected[0].substr(1, 3);
				var curDeptId = data.selected[0].substr(4, 4);
				
				if ($('.dataTables_filter input').val().length > 0) {
					$('#tblUser').DataTable().search("").draw();
				}
				
				$('#tblUser').DataTable().ajax.url(
					'./ajax/getUserlist?compId=' + curCompId + '&deptId=' + curDeptId + '&resigned=0').load();
			}
		}).on('move_node.jstree', function(e, data) {
			var curCompId = data.node.id.substr(1, 3);
			var curDeptId = data.node.id.substr(4, 4);
			var curParentDeptId = data.parent == '#' ? data.parent : data.parent.substr(4, 4);
			
			$.ajax({
				dataType: 'json', 
				type: 'post', 
				url: './ajax/moveSingleDept', 
				data: { 
					compId: curCompId,  
					deptId: curDeptId, 
					parentDeptId: curParentDeptId, 
					children: createJsonChildren(data.instance.get_node(data.parent)) 
				}, 
				success: function(data) {
					toastrAlert('success', '이동되었습니다.');
				} 
			});
		});
		
		/* userlist Data Binding */
		$('#tblUser').DataTable({
			ajax: { "url": './ajax/getUserlist', "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
				{ 
					"mRender": function(data, type, full) { return '<input type="checkbox" class="cbr">'; }, 
					"sClass": "user-cb"
				}, 
				{
					"mRender": function(data, type, full) { return imageRender(data, type, full); }, 
					"sClass": "user-image"
				}, 
				{ "mData": "compId", "visible": false }, 
        { "mData": "deptName" }, 
      	{ "mData": "userName" }, 
      	{ "mData": "userId" }, 
      	{ "mData": "jobTitleName" }, 
      	{ "mData": "mailId", "sClass": "user-mail" }, 
      	{ "mData": "sortOrder", "visible": false }
      ], 
      order: [ [8, "asc"] ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>" 
		});
		
		/* 부서 추가 */
		$('#btnDeptAdd').on('click', function() {
			var selNode = $('#jstreeDept').jstree(true).get_selected('full', true);
			
			if (selNode.length == 0) {
				toastrAlert('error', '상위부서를 선택하세요.');
				
			} else {
				var selCompId = selNode[0].id.substr(1, 3);
				var selDeptId = selNode[0].id.substr(4, 4);
				var selDeptName = selNode[0].text;
				
				var sUrl = './modal/deptNew';
				var sUri = '?compId=' + selCompId + '&parDeptId=' + selDeptId + '&parDeptName=' + selDeptName;
				
				$.get(sUrl + sUri, function(data) {
					modalToggle(true, data);
				});
			}
		});
		
		/* 부서 정보 */
		$('#btnDeptEdit').on('click', function() {
			var selNode = $('#jstreeDept').jstree(true).get_selected('full', true);
			
			if (selNode.length == 0) {
				toastrAlert('error', '변경할 부서를 선택하세요.');
				
			} else {
				var selCompId = selNode[0].id.substr(1, 3);
				var selDeptId = selNode[0].id.substr(4, 4);
				
				sUrl = './modal/deptNew';
				sUri = '?opener=jstree&compId=' + selCompId + '&deptId=' + selDeptId;
				
				$.get(sUrl + sUri, function(data) {
					modalToggle(true, data, '부서 정보');
				});
			}
		});
		
		/* 부서 삭제(Soft Delete) */
		$('#btnDeptDelete').on('click', function() {
			var instance = $('#jstreeDept').jstree(true);
			var selNode = instance.get_selected();

			if (selNode.length == 0) {
				toastrAlert('error', '삭제할 부서를 선택하세요.');
			} else {
				$.ajax({
					dataType: 'json', 
					type: 'post', 
					url: '../../plugin/ajax/getChildNodeCount', 
					data: { compId: selNode[0].substr(1, 3), deptId: selNode[0].substr(4, 4) }, 
					success: function(data) {
						if (data > 0) {
							toastrAlert('error', '하위 부서가 있거나 등록된 부서원이 있을 경우 삭제할 수 없습니다.');
						} else {
							bootbox.confirm('삭제하시겠습니까?', function(result) {
								if (result) {
									$.ajax({
										dataType: "json", 
										type: "post", 
										url: contextPath + "/admin/ajax/deleteSingleDept", 
										data: { mode: 'soft', compId: selNode[0].substr(1, 3), deptId: selNode[0].substr(4, 4) }, 
										success: function(data) {
											instance.delete_node(selNode);
										}
									});
								}
							});
						}
					}
				});
			}
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
		
		/* 사용자 검색 */
		$('.dataTables_filter input').unbind().keyup(function(e) {
			if (e.keyCode == 13) {
				if ($(this).val().length == 0) {
					toastrAlert('error', '검색어를 입력하세요.');
				} else {
					var sUrl = './ajax/getUserlist';
					var sUri = '?compId=' + prmCompId + '&resigned=0&keyword=' + $(this).val();
					
					$('#tblUser').DataTable().ajax.url(sUrl + sUri).load();
				}
			}
		});
		
		/* 부서이동 */
		$('#btnUserMove').on('click', function() {
			
			var $checked = $('tbody :checkbox:checked', $('#tblUser'));
			
			if ($checked.length > 0) {
				$.get('./modal/deptTree?opener=moveuser', function(data) {
					modalToggle(true, data);
				});
			} else {
				toastrAlert('error', '이동할 계정을 선택하세요.');
			}
		});
		
		/* 정렬순서 */
		$('#btnRelocation').on('click', function() {
			var instance = $('#jstreeDept').jstree(true);
			var selNode = instance.get_selected();
			
			if (selNode.length == 0) {
				toastrAlert('error', '부서를 선택하세요.');
			} else {
				var selCompId = selNode[0].substr(1, 3);
				var selDeptId = selNode[0].substr(4, 4);
				
				var sUrl = contextPath + '/modal/admin/userTable';
				var sUri = '?compId=' + selCompId + '&deptId=' + selDeptId;
				
				$.get(sUrl + sUri, function(data) {
					modalToggle(true, data);
				});
			}
		});
		
		/* 사용자 추가 */
		$('#btnUserAdd').on('click', function() {
			var instance = $('#jstreeDept').jstree(true);
			var selNode = instance.get_selected('full', true);
			
			if (selNode.length == 0) {
				toastrAlert('error', '부서를 먼저 선택하세요.');
			} else {
				var selCompId = selNode[0].id.substr(1, 3);
				var selDeptId = selNode[0].id.substr(4, 4);
				var selDeptName = selNode[0].text;

				var sUrl = './modal/userNew';
				var sUri = '?compId=' + selCompId + '&deptId=' + selDeptId + '&deptName=' + selDeptName;
				
				$.get(sUrl + sUri, function(data) {
					modalToggle(true, data);
				});
			}
		});
		
		/* 사용자 삭제(Soft Delete) */
		$('#btnUserDelete').on('click', function() {
 			var $checked = $('tbody :checkbox:checked', $('#tblUser'));

 			if ($checked.length > 0) {
 				bootbox.confirm('선택된 계정을 삭제하시겠습니까?', function(result) {
 					if (result) {
 						$.ajax({
 							dataType: 'json', 
 							type: 'post', 
 							url: './ajax/deleteUserList', 
 							data: { mode: 'soft', userlist: createJsonUserlist() }, 
 							success: function(data) {
 								toastrAlert('success', data + '개의 사용자 계정이 삭제되었습니다.');
 								$('#tblUser').DataTable().ajax.reload(null, false);
 							}
 						});
 					}
 				});
 			} else {
 				toastrAlert('error', '삭제할 계정을 선택하세요.');
 			}
		});
		
		/* jsTree child nodelist 생성 */
		var createJsonChildren = function(parentNode) {
			var jsonObj = [];

			$.each(parentNode.children, function(index, element) {
				var jsonItem = {};
				
				jsonItem["compId"] = element.substr(1, 3);
				jsonItem["deptId"] = element.substr(4, 4);
				jsonItem["sortOrder"] = index;
				
				jsonObj.push(jsonItem);
			});
			
			return JSON.stringify(jsonObj);
		}
		
		/* 사용자 json object 생성 */
		var createJsonUserlist = function() {
			var jsonObj = [];
			var oTable = $('#tblUser').dataTable();
			
			$('tbody :checkbox:checked', oTable).each(function(index) {
				var jsonItem = {};
				var aData = oTable.fnGetData($(this).closest('tr'));
				
				jsonItem['compId'] = aData.compId;
				jsonItem['userId'] = aData.userId;
				jsonItem['useYn'] = 0;
				
				jsonObj.push(jsonItem);
			});

			return JSON.stringify(jsonObj);
		};
		
		/* 사용자 이미지 rendering... */
		var imageRender = function(data, type, full) {
			var result = "";
			
			result += "<a href='#'>";
			result += "<img src='${pageContext.request.contextPath}";
			result += "/assets/images/user-1.png' class='img-circle' alt='user-pic' />";
			result += "</a>";
			
			return result;
		};

	});

/* ***References***
	How to get value entered in search box in Datatables: 
		http://stackoverflow.com/questions/26590778/how-to-get-value-entered-in-search-box-in-datatables
*/

</script>

<style>
	/*** main-content customized(for jstree indicator arrows) ***/
	.page-container .main-content {
		position: static;
	}
</style>