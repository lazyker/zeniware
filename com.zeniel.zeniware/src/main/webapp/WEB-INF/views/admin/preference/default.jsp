<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">공통코드 관리</h3>		
	</div>
	
	<div class="panel-body">
		
		<script type="text/javascript">
		$(document).ready(function() {
 			var table = $('#example').dataTable({
				"ajax": '${pageContext.request.contextPath}/admin/preference/ajax', 
				"aoColumns": [
        	{ "mData": "groupId" }, 
        	{ "mData": "codeId" }, 
        	{ "mData": "codeNameKo" },
        	{ "mData": "codeNameEn" }, 
        	{ "mData": "codeNameCn" }, 
        	{ "mData": "codeNameJp" }, 
        	{ "mData": "sortOrder" }, 
        	{ "mData": "useYn" }, 
        	{ "mData": "description" }, 
        	{ "mData": "regDate" }, 
        	{ "mData": "modDate" }
        ], 
				"aoColumnDefs": [{
					"aTargets": [7], 
					"mData": "useYn", 
					"mRender": function(data, type, full) {
						var checked = "";
						
						if (data == true) checked = " checked";
							
						return '<input type="checkbox" class="selector" data-id="' + data + '"' + checked + '>';
					}
				}]
			});
 			
 			$('#example tbody').on('click', 'tr', function() {
 				if ($(this).hasClass('selected')) {
 					$(this).removeClass('selected');
 					
 				} else {
 					table.$('tr.selected').removeClass('selected');
 					$(this).addClass('selected');
 				}
 			
 			});
 			
/* 			$('#button').click(function() {
				table.row('.selected').remove().draw(false);
			}); */
			
		});
		</script>
		
		<table id="example" class="table table-model-2 table-small-font table-hover" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>그룹ID</th>
					<th>코드ID</th>
 					<th>코드명(국문)</th>
					<th>코드명(영문)</th>
					<th>코드명(중문)</th>
					<th>코드명(일문)</th>
					<th>정렬순서</th>
					<th>사용여부</th>
					<th>상세설명</th>
					<th>등록일시</th>
					<th>변경일시</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>그룹ID</th>
					<th>코드ID</th>
 					<th>코드명(국문)</th>
					<th>코드명(영문)</th>
					<th>코드명(중문)</th>
					<th>코드명(일문)</th>
					<th>정렬순서</th>
					<th>사용여부</th>
					<th>상세설명</th>
					<th>등록일시</th>
					<th>변경일시</th>
				</tr>
			</tfoot>
		</table>
		
	</div>
</div>