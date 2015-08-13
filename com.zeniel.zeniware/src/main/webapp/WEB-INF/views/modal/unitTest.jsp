<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

	

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Unit Test</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/jstree/themes/default/style.css">
	
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/xenon-core.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/xenon-forms.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/xenon-components.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/xenon-skins.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/jstree/themes/default/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>
	
</head>

<body>

	<div class="row">
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
					<div id="jstreeMember"></div>
				</div>
			</div>
			
		</div>
	</div>

</body>

</html>

<script type="text/javascript">
	
	jQuery(document).ready(function($) {
		
		/* jsTree Data Binding */
		$('#jstreeMember').jstree({
			'core': {
				'data': {
					'url': function(node) {
						var paramCompId = node.id.substr(1, 3);
						var paramDeptId = node.id.substr(4, 4);
						
						return node.id == '#' ? 
							'../admin/ajax/getNodelistDefer?compId=' + '001' + '&nodeType=root&resultType=U' : 
							'../admin/ajax/getNodelistDefer?compId=' + paramCompId + '&deptId=' + paramDeptId + '&nodeType=child&resultType=U';
					}, 
					'data': function(node) {
						return { 'id': node.id };
					}
				}, 
				'check_callback': true
			}, 
			'plugins': [ 'dnd' ]
		});
		
	});
</script>

<!-- Bottom Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/resizeable.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/joinable.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/xenon-api.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/xenon-toggles.js"></script>

<!-- Imported scripts on this page -->
<script src="${pageContext.request.contextPath}/assets/js/datatables/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datepicker/locales/bootstrap-datepicker.kr.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jstree/jstree.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/select2/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/toastr/toastr.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/custom/preference.js"></script>