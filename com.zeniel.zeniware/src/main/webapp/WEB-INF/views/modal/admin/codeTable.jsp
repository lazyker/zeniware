<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title">정렬순서 변경</h4>
</div>

<div class="modal-body">

	<div class="panel panel-flat">
	
		<div class="panel-body">

			<table id="tblCodeSort" class="table table-small-font middle-align table-hover">
				<thead>
					<tr>
						<th class="no-sorting">그룹ID</th>
						<th class="no-sorting">그룹명</th>
						<th class="no-sorting">코드ID</th>
						<th class="no-sorting">코드명(Ko)</th>
						<th class="no-sorting">코드명(En)</th>
						<th class="no-sorting">코드명(Zh)</th>
						<th class="no-sorting">코드명(Ja)</th>
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

		var prmGroupId = "${groupId}";
		var contextPath = "${pageContext.request.contextPath}";
		
		/* codelist data binding */
		$('#tblCodeSort').DataTable({
			ajax: {
				"url": contextPath + "/admin/ajax/getCodelist?groupId=" + prmGroupId, 
				"dataSrc": ""
			}, 
			deferRender: true, 
			paging: false, 
			rowReorder: { selector: 'tr', snapX: 10, update: false }, 
			aoColumns: [
				{ "mData": "groupId" }, 
        { "mData": "groupNameKo" }, 
      	{ "mData": "codeId" }, 
      	{ "mData": "codeNameKo" }, 
      	{ "mData": "codeNameEn" }, 
      	{ "mData": "codeNameZh" },
      	{ "mData": "codeNameJa" }, 
      	{ "mData": "sortOrder", "visible": false }
      ], 
      order: [ [7, "asc"] ], 
 			sDom: "rti"
		});
		
		$('#btnSave').on('click', function() {
			if ($('#tblCodeSort').dataTable().fnGetData().length > 0) {
				bootbox.confirm('저장하시겠습니까?', function(result) {
					if (result) {
						$.ajax({
							dataType: 'json', 
							type: 'post', 
							url: contextPath + '/admin/ajax/setCodeListSort', 
							data: { userlist: createJsonCodelist() }, 
							success: function(data) {
								modalToggle(false);
								$('#tblCode').DataTable().ajax.reload(null, false);
							}
						})
					}
				});
			} else {
				toastrAlert('error', '코드가 존재하지 않습니다.');
			}
		});
		
		var createJsonCodelist = function() {
			var jsonObj = [];
			var oTable = $('#tblCodeSort').dataTable();

			$.each($('#tblCodeSort tbody tr'), function(index, element) {
				var jsonItem = {};
				var aData = oTable.fnGetData(element);
				
				jsonItem['groupId'] = aData.groupId;
				jsonItem['codeId'] = aData.codeId;
				jsonItem['sortOrder'] = index;
				
				jsonObj.push(jsonItem);
			});

			return JSON.stringify(jsonObj);
		};
		
	});

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