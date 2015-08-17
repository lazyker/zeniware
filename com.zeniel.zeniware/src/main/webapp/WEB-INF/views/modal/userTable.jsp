<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table id="tblUserSort" class="table table-small-font middle-align table-hover">
	<thead>
		<tr>
			<th class="no-sorting hidden-xs hidden-sm"></th>
			<th class="no-sorting">회사ID</th>
			<th class="no-sorting">부서명</th>
			<th class="no-sorting">성명</th>
			<th class="no-sorting">ID</th>
			<th class="no-sorting">직위</th>
			<th class="no-sorting">메일</th>
		</tr>
	</thead>
</table>

<script type="text/javascript">

	$(document).ready(function() {
		
		/* userlist Data Binding */
		$('#tblUserSort').DataTable({
			ajax: {
				"url": "../ajax/getUserlist?compId=001&deptId=0043&resigned=0", 
				"dataSrc": ""
			}, 
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
		});
		
		$('#tblUserSort tbody').sortable({
			items: "> tr", 
			appendTo: "parent", 
			helper: "clone", 
			start: function(e, ui) { }
		}).disableSelection();
		
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
