<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title">정렬순서 변경</h4>
</div>

<div class="modal-body">

	<div class="panel panel-flat">
	
		<div class="panel-body">

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
						<th class="no-sorting">정렬순서</th>
					</tr>
				</thead>
			</table>
			
		</div>
		
	</div>

</div>
				
<div class="modal-footer">
	<button type="button" class="btn btn-info" id="btnSave">확인</button>
	<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		var prmCompId = "${compId}";
		var prmDeptId = "${deptId}";

		/* userlist Data Binding */
		$('#tblUserSort').DataTable({
			ajax: {
				"url": './ajax/getUserlist?compId=' + prmCompId + '&deptId=' + prmDeptId + '&resigned=0', 
				"dataSrc": ""
			}, 
			deferRender: true, 
			paging: false, 
			rowReorder: { selector: 'tr', snapX: 10, update: false }, 
			columns: [
				{ render: function(data, type, full) { return imageRender(data, type, full); }, className: "user-image" }, 
				{ data: 'compId', visible: false }, 
        { data: 'deptName' }, 
      	{ data: 'userName' }, 
      	{ data: 'userId' }, 
      	{ data: 'jobTitleName' }, 
      	{ data: 'mailId' }, 
      	{ data: 'sortOrder', visible: false }
      ], 
      order: [ [7, "asc"] ],  
 			sDom: "rti"
		});
		
		$('#btnSave').on('click', function() {
			if ($('#tblUserSort').dataTable().fnGetData().length > 0) {
				bootbox.confirm('저장하시겠습니까?', function(result) {
					if (result) {
						$.ajax({
							dataType: 'json', 
							type: 'post', 
							url: './ajax/setUserListSort', 
							data: { userlist: createJsonUserlist() }, 
							success: function(data) {
								modalToggle(false);
								$('#tblUser').DataTable().ajax.reload(null, false);
							}
						})
					}
				});
			} else {
				toastrAlert('error', '부서원이 존재하지 않습니다.');
			}
		});
		
		var createJsonUserlist = function() {
			var jsonObj = [];
			var oTable = $('#tblUserSort').dataTable();

			$.each($('#tblUserSort tbody tr'), function(index, element) {
				var jsonItem = {};
				var aData = oTable.fnGetData(element);
				
				jsonItem['compId'] = aData.compId;
				jsonItem['userId'] = aData.userId;
				jsonItem['sortOrder'] = index;
				
				jsonObj.push(jsonItem);
			});

			return JSON.stringify(jsonObj);
		};
		
		/* 사용자 이미지 Rendering... */
		var imageRender = function(data, type, full) {
			var result = "";
			
			if (type == 'display') {
				result += "<a href='#'>";
				result += "<img src='${pageContext.request.contextPath}";
				result += "/assets/images/user-1.png' class='img-circle' alt='user-pic' />";
				result += "</a>";
			}
			
			return result;
		};
		
	});
	
/* ***References***
	Scroll - vertical, dynamic height: https://www.datatables.net/examples/basic_init/scroll_y_dynamic.html
*/

</script>

<style>

	.modal .modal-dialog {
		width: 60%;
	}
	
 	.modal .modal-body .panel {
 		height: 50vh;
 		overflow-x: hidden;
 		overflow-y: auto;
 	}

</style>