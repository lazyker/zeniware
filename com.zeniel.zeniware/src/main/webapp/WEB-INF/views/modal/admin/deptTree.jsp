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
		
			<div id="jstreeDept"></div>
		
		</div>
	
	</div>
	
</div>
				
<div class="modal-footer">
	<button type="button" class="btn btn-info">확인</button>
	<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
</div>

<script type="text/javascript">
	
	jQuery(document).ready(function($) {
		
		/* jsTree Data Binding */
		$('#jstreeDept').jstree({
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
			}
		});
		
	});
	
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