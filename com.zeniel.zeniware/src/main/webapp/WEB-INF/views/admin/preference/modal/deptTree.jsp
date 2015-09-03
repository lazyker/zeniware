<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="currentUser" property="principal" />

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title">이동할 부서 선택</h4>
</div>
				
<div class="modal-body">

	<div class="panel panel-flat">
	
		<div class="panel-body">
		
			<div id="jstreeModalDept"></div>
		
		</div>
	
	</div>
	
</div>
				
<div class="modal-footer">
	<button type="button" class="btn btn-info" id="btnSave">확인</button>
	<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
</div>

<script type="text/javascript">
	
	jQuery(document).ready(function($) {
		
		/* jsTree Data Binding */
		$('#jstreeModalDept').jstree({
			'core': {
				'data': {
					'url': function(node) {
						var sUrl = '../../plugin/ajax/getNodelistDefer';
						var prmCompId = node.id.substr(1, 3);
						var prmDeptId = node.id.substr(4, 4);
						
						return node.id == '#' ? 
							sUrl + '?compId=' + '001' + '&nodeType=root&resType=D' : 
							sUrl + '?compId=' + prmCompId + '&deptId=' + prmDeptId + '&nodeType=child&resType=D';
					}, 
					'data': function(node) {
						return { 'id': node.id };
					}, 
				}
			}, 
			"multiple": false
		}).on('changed.jstree', function(e, data) {
			data.instance.toggle_node(data.node);
		});
		
		$('#btnSave').on('click', function() {
			var opener = "${opener}";
			
			if (opener == 'moveuser') {
				moveuserCallback();
			} else if (opener == 'restoreuser') {
				restoreuserCallback();
			} else if (opener == 'restoredept') {
				restoredeptCallback();
			}
		});
		
	});
	
	/* 사용자 계정 이동 */
	function moveuserCallback() {
		var instance = $('#jstreeModalDept').jstree(true);
		var selNode = instance.get_selected();
		
		if (selNode.length == 0) {
			toastrAlert('error', '이동할 부서를 선택하세요.');
		} else {
			bootbox.confirm('선택된 부서로 이동하시겠습니까?', function(result) {
				if (result) {
					$.ajax({
						dataType: 'json', 
						type: 'post', 
						url: './ajax/moveUserList', 
						data: {
							compId: selNode[0].substr(1, 3), 
							deptId: selNode[0].substr(4, 4), 
							userlist: createUserlist()
							}, 
						success: function(data) {
							toastrAlert('success', '이동되었습니다.');
							modalToggle(false);
							
							var orgInstance = $('#jstreeDept').jstree(true);
							var orgSelNode = orgInstance.get_selected();
							
							orgInstance.deselect_all();
							orgInstance.select_node(selNode);
						}
					});
				}
			});
		}
	}
	
	/* 사용자 계정 복원 */
	function restoreuserCallback() {
		var instance = $('#jstreeModalDept').jstree(true);
		var selNode = instance.get_selected();
		
		if (selNode.length == 0) {
			toastrAlert('error', '복원할 부서를 선택하세요.');
		} else {
			bootbox.confirm('선택된 부서로 복원하시겠습니까?', function(result) {
				if (result) {
					$.ajax({
						dataType: 'json', 
						type: 'post', 
						url: './ajax/restoreUserList', 
						data: {
							compId: selNode[0].substr(1, 3), 
							deptId: selNode[0].substr(4, 4), 
							userlist: createUserlist()
						}, 
						success: function(data) {
							toastrAlert('success', data + '개의 사용자 계정이 복원되었습니다.');
							modalToggle(false);
							
							$('#tblUser').DataTable().ajax.reload(null, false);
						}
					});
				}
			});
		}
	}
	
	/* 부서 복원 */
	function restoredeptCallback() {
		var instance = $('#jstreeModalDept').jstree(true);
		var selNode = instance.get_selected();
		
		if (selNode.length == 0) {
			toastrAlert('error', '상위 부서를 선택하세요.');
		} else {
			bootbox.confirm('선택된 부서의 하위로 복원하시겠습니까?', function(result) {
				if (result) {
					$.ajax({
						dataType: 'json', 
						type: 'post', 
						url: './ajax/restoreDeptList', 
						data: {
							parentDeptId: selNode[0].substr(4, 4), 
							deptlist: createDeptlist()
						}, 
						success: function(data) {
							toastrAlert('success', data + '개의 부서가 복원되었습니다.');
							modalToggle(false);
							
							$('#tblDept').DataTable().ajax.reload(null, false);
						}
					});
				}
			});
		}
	}
	
	/* 사용자 json object 생성 */
	function createUserlist() {
		var jsonObj = [];
		var oTable = $('#tblUser').dataTable();
		
		$('tbody :checkbox:checked', oTable).each(function(index) {
			var jsonItem = {};
			var aData = oTable.fnGetData($(this).closest('tr'));
			
			jsonItem['compId'] = aData.compId;
			jsonItem['userId'] = aData.userId;
			
			jsonObj.push(jsonItem);
		});

		return JSON.stringify(jsonObj);
	};
	
	/* 부서 json object 생성 */
	function createDeptlist() {
		var jsonObj = [];
		var oTable = $('#tblDept').dataTable();
		
		$('tbody :checkbox:checked', oTable).each(function(index) {
			var jsonItem = {};
			var aData = oTable.fnGetData($(this).closest('tr'));
			
			jsonItem['compId'] = aData.compId;
			jsonItem['deptId'] = aData.deptId;
			
			jsonObj.push(jsonItem);
		});
		
		return JSON.stringify(jsonObj);
	}
	
</script>

<style>

	.modal .modal-dialog {
		width: 25%;
	}
	
	.modal .modal-body .panel {
		height: 50vh;
		overflow-y: auto;
	}

</style>