<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Unit Test</title>

	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.8/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.0.0/css/rowReorder.dataTables.min.css">
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>
	
</head>

<body>

		<table id="tblUserSort" class="table table-small-font middle-align table-hover">
			<thead>
				<tr>
					<th class="no-sorting hidden-xs hidden-sm"></th>
					<th class="no-sorting hidden-xs hidden-sm">회사ID</th>
					<th class="no-sorting hidden-xs hidden-sm">부서명</th>
					<th class="no-sorting hidden-xs hidden-sm">성명</th>
					<th class="no-sorting hidden-xs hidden-sm">ID</th>
					<th class="no-sorting hidden-xs hidden-sm">직위</th>
					<th class="no-sorting hidden-xs hidden-sm">메일</th>
				</tr>
			</thead>
		</table>

<script type="text/javascript">

$(document).ready(function() {
	
	var prmCompId = "${compId}";
	var prmDeptId = "${deptId}";
	var contextPath = "${pageContext.request.contextPath}";
	
	/* userlist Data Binding */
	$('#tblUserSort').DataTable({
		ajax: {
			"url": contextPath + "/admin/ajax/getUserlist?compId=" + prmCompId + "&deptId=" + prmDeptId + "&resigned=0", 
			"dataSrc": ""
		}, 
		rowReorder: { selector: 'tr' }, 
		deferRender: true, 
		paging: false, 
		scrollY: 400, 
		scrollCollapse: true, 
		
		aoColumns: [
			{ "mRender": function(data, type, full) { return rendering(data, type, full); } }, 
			{ "mData": "compId", "visible": false }, 
	    { "mData": "deptName" }, 
	  	{ "mData": "userName" }, 
	  	{ "mData": "userId" }, 
	  	{ "mData": "jobTitleName" }, 
	  	{ "mData": "mailId" }
	  ], 
		sDom: "rti"
	}).on('row-reorder', function(e, diff, edit) {
		var result = '';

		for (var i=0, ien=diff.length ; i<ien ; i++ ) {
			var rowData = $('#tblUserSort').DataTable().row(diff[i].node).data();
 
			result += rowData[1]+' updated to be in position ' + diff[i].newData + ' (was ' + diff[i].oldData + ')';
		}
		
		console.log(result);
	});
	
	$('#btnSave').on('click', function() {
		$('#tblUserSort').dataTable().fnDraw();
		var wholeRow = $('#tblUserSort').DataTable().rows().data();
//			if (wholeRow.length > 0) {
//				bootbox.confirm("저장하시겠습니까?", function(result) {
//					if (result) {
//						$.ajax({
//							dataType: "json", 
//							type: "post", 
//							url: contextPath + "/admin/ajax/setUserListSort", 
//							data: { userlist: createJsonUserlist() }, 
//							success: function(data) {
//								modalToggle(false);
//								$('#tblUser').DataTable().ajax.reload(null, false);
//							} 
//						});
//					}
//				});
//			
//			} else {
//				toastrAlert('error', '저장할 사용자가 없습니다.');
//			}
	});
	
	var createJsonUserlist = function() {
		var jsonObj = [];
		
		$.each($('#tblUser').DataTable().rows().data(), function(index, element) {
			var jsonItem = {};

			jsonItem["compId"] = element.compId;
			jsonItem["userId"] = element.userId;
			jsonItem["sortOrder"] = index;
			
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
	
});

</script>

</body>

</html>



<script src="${pageContext.request.contextPath}/assets/js/datatables/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/dataTables.rowReorder.min.js"></script>
