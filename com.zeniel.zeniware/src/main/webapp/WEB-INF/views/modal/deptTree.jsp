<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="currentUser" property="principal" />

<div id="jstreeDept"></div>

<script type="text/javascript">
	
	jQuery(document).ready(function($) {
		
		/* jsTree Data Binding */
		$('#jstreeDept').jstree({
			'core': {
				'data': {
					'url': function(node) {
						var contextPath = "${pageContext.request.contextPath}";
						var paramCompId = node.id.substr(1, 3);
						var paramDeptId = node.id.substr(4, 4);
						
						return node.id == '#' ? 
							contextPath + '/admin/ajax/getNodelistDefer?compId=' + '001' + '&nodeType=root&resultType=D' : 
							contextPath + '/admin/ajax/getNodelistDefer?compId=' + paramCompId + '&deptId=' + paramDeptId + '&nodeType=child&resultType=D';
					}, 
					'data': function(node) {
						return { 'id': node.id };
					}, 
				}, 
				'check_callback': true
				
			}, 
			'plugins': [ 'dnd' ]
		});
		
	});
	
</script>