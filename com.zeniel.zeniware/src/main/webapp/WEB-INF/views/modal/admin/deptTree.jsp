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
	
	var contextPath = "${pageContext.request.contextPath}";

	jQuery(document).ready(function($) {
		
		/* jsTree Data Binding */
		$('#jstreeModalDept').jstree({
			'core': {
				'data': {
					'url': function(node) {
						var contextPath = "${pageContext.request.contextPath}";
						var prmCompId = node.id.substr(1, 3);
						var prmDeptId = node.id.substr(4, 4);
						
						return node.id == '#' ? 
							contextPath + '/admin/ajax/getNodelistDefer?compId=' + '001' + '&nodeType=root&resType=D' : 
							contextPath + '/admin/ajax/getNodelistDefer?compId=' + prmCompId + '&deptId=' + prmDeptId + '&nodeType=child&resType=D';
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
				moveCallback();
			} else if (opener == 'restoreuser') {
				restoreCallback();
			}
		});
		
	});
	
	function moveCallback() {
		var instance = $('#jstreeModalDept').jstree(true);
		var selNode = instance.get_selected();
		
		if (selNode.length == 0) {
			toastrAlert('error', '이동할 부서를 선택하세요.');
		} else {
			$.ajax({
				dataType: "json", 
				type: "post", 
				url: contextPath + "/admin/ajax/moveUserList", 
				data: {
					compId: selNode[0].substr(1, 3), 
					deptId: selNode[0].substr(4, 4), 
					userlist: createJsonUserlist()
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
	}
	
	function restoreCallback() {
		
	}
	
	/* 사용자 json object 생성 */
	function createJsonUserlist() {
		var jsonObj = [];
		var oTable = $('#tblUser').dataTable();
		
		$('input:checked', oTable.fnGetNodes()).each(function(i) {
			var jsonItem = {};
			var aData = oTable.fnGetData(i);
			
			jsonItem['compId'] = aData.compId;
			jsonItem['userId'] = aData.userId;
			
			jsonObj.push(jsonItem);
		});

		return JSON.stringify(jsonObj);
	};
	
</script>

<style>

	.modal .modal-dialog {
		width: 25%;
	}
	
	.modal .modal-body {
		height: 300px;
		overflow-y: auto;
	}

</style>