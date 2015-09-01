<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">공통 코드 관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="../preference/codeMain">환경설정</a></li>
			<li class="active"><strong>공통코드관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">
	<div class="col-sm-4">
	
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<h3 class="panel-title">코드그룹</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-white btn-sm" id="btnGroupAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnGroupEdit">변경</button>
						<button class="btn btn-white btn-sm" id="btnGroupDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblGroup" class="table table-small-font table-striped table-hover">
					<thead>
						<tr>
							<th>그룹ID</th>
							<th>그룹명</th>
						</tr>
					</thead>
				</table>
			</div>
		
		</div>
	
	</div>
	
	<div class="col-sm-8">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">코드정보</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-white btn-sm" id="btnRelocation">정렬순서</button>
						<button class="btn btn-white btn-sm" id="btnCodeAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnCodeDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="tblCode" class="table table-small-font table-striped table-hover">
					<thead>
						<tr>
							<th class="no-sorting user-cb"><input type="checkbox" class="cbr"></th>
							<th>그룹ID</th>
							<th>코드ID</th>
		 					<th>코드명(Ko)</th>
							<th>코드명(En)</th>
							<th>코드명(Zh)</th>
							<th>코드명(Ja)</th>
							<th>사용여부</th>
							<th>정렬순서</th>
						</tr>
					</thead>
				</table>
			</div>
		
		</div>
	
	</div>
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		var msg01 = "공통코드 삭제";
		var msg02 = "삭제하시겠습니까?";
		var msg03 = "확인";
		var msg04 = "취소";
		var msg05 = "변경할 코드그룹을 선택하세요.";
		var msg06 = "삭제할 코드그룹을 선택하세요.";
		var msg07 = "등록된 코드가 있을 경우 코드그룹을 삭제할 수 없습니다."
		var msg08 = "코드그룹을 먼저 선택하세요.";
		var msg09 = "변경할 코드를 선택하세요.";
		var msg10 = "변경할 코드를 하나만 선택하세요."
		var msg11 = "삭제할 코드를 선택하세요.";
		
		/* Grouplist Data Binding */
		$('#tblGroup').dataTable({
			ajax: { "url": "./ajax/getGrouplist", "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
      	{ "mData": "groupId" }, 
      	{ "mData": "groupName" }
      ], 
      sDom: "frtp"
		});
		
		/* Codelist Data Binding */
		$('#tblCode').DataTable({
			ajax: { "url": "./ajax/getCodelist", "dataSrc": "" }, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
				{ 
					"mRender": function(data, type, full) { return '<input type="checkbox" class="cbr">'; }, 
					"sClass": "user-cb"
				}, 
      	{ "mData": "groupId" }, 
      	{ "mData": "codeId" }, 
      	{ "mData": "codeNameKo" }, 
      	{ "mData": "codeNameEn" }, 
      	{ "mData": "codeNameZh" }, 
      	{ "mData": "codeNameJa" }, 
      	{ "mData": "useYn" }, 
      	{ "mData": "sortOrder", "visible": false }
      ], 
      order: [ [8, "asc"] ], 
 			sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		/* 그룹 선택 */
		$("#tblGroup tbody").on('click', 'tr', function() {
			var tbl = $("#tblGroup").dataTable();
			var position = tbl.fnGetPosition(this);
			var selectedGroupId = tbl.fnGetData(position).groupId;
			
			$('#tblGroup').DataTable().$('tr.selected').removeClass('selected');
			$(this)[$(this).hasClass('selected') ? 'removeClass' : 'addClass']('selected');			

			$('#tblCode').DataTable().ajax.url('./ajax/getCodelist?groupId=' + selectedGroupId).load();
		});
		
		/* 그룹 추가 */
		$("#btnGroupAdd").on('click', function() {
 			$.get('./modal/codeNew?opener=group&groupId=00000', function(data) {
				modalToggle(true, data, '그룹 추가');
			});
		});
		
		/* 그룹 변경 */
		$("#btnGroupEdit").on('click', function() {
			var selData = $("#tblGroup").DataTable().rows(".selected").data();
			
			if (selData.length == 0) {
				toastrAlert('error', msg05);
				
			} else {
				var sUrl = './modal/codeNew';
				var sUri = '?opener=group&groupId=00000&codeId=' + selData[0].groupId;
				$.get(sUrl + sUri, function(data) {
					modalToggle(true, data, '그룹 정보');
				});
			}
		});
		
		/* 그룹 삭제 */
		$("#btnGroupDelete").on('click', function(event) {
			var selData = $("#tblGroup").DataTable().rows(".selected").data();
			
			if (selData.length == 0) {
				toastrAlert('error', msg06);
			} else {
				var selChildData = $('#tblCode').DataTable().rows().data();
				
				if (selChildData.length > 0) {
					toastrAlert('error', msg07);
				} else {
					bootbox.confirm('코드그룹을 삭제하시겠습니까?', function(result) {
						$.ajax({
							dataType: "json", 
							type: "POST", 
							url: "./ajax/deleteCodeList", 
							data: { codelist: createJsonGrouplist() }, 
							success: function(data) {
								toastrAlert('success', '삭제되었습니다.');
								$('#tblGroup').DataTable().ajax.reload(null, false);
							}
						});
					});
				}
			}
		});
		
		/* 코드 정보 */
		$('#tblCode tbody').on('click', 'tr td:not(:first-child)', function() {
			var oTable = $('#tblCode').dataTable();
			var aPos = oTable.fnGetPosition(this);
			var aData = oTable.fnGetData(aPos);
			
			var sUrl = './modal/codeNew';
 			var sUri = '?opener=code&groupId=' + aData.groupId + '&codeId=' + aData.codeId;

 			$.get(sUrl + sUri, function(data) {
				modalToggle(true, data, '코드 정보');
			});
		});
		
		/* 코드 추가 */
		$("#btnCodeAdd").on('click', function() {
			var selData = $("#tblGroup").DataTable().rows(".selected").data();
			
			if (selData.length == 0) {
				toastrAlert('error', msg08);
			} else {
				var sUrl = './modal/codeNew';
	 			var sUri = '?opener=code&groupId=' + selData[0].groupId;

	 			$.get(sUrl + sUri, function(data) {
					modalToggle(true, data);
				});
			}
		});
		
		/* 코드 삭제 */
		$("#btnCodeDelete").on('click', function() {
			var $checked = $('tbody :checkbox:checked', $('#tblCode'));
			
			if ($checked.length > 0) {
				bootbox.confirm('선택된 코드를 삭제하시겠습니까?', function(result) {
					$.ajax({
						dataType: "json", 
						type: "POST", 
						url: "./ajax/deleteCodelist", 
						data: { codelist: createJsonCodelist() }, 
						success: function(data) {
							toastrAlert('success', data + '개의 코드가 삭제되었습니다.');
							$('#tblCode').DataTable().ajax.reload(null, false);
						} 
					});
				});				
			} else {
				toastrAlert('error', msg11);
			}
		});
		
		/* 정렬순서 */
		$('#btnRelocation').on('click', function () {
			var selData = $("#tblGroup").DataTable().rows(".selected").data();
			
			if (selData.length == 0) {
				toastrAlert('error', '그룹코드를 선택하세요.');
			} else {
				var sUrl = './modal/codeTable';
				var sUri = '?groupId=' + selData[0].groupId;
				
				$.get(sUrl + sUri, function(data) {
					modalToggle(true, data);
				});
			}
		});
		
		/* 그룹 Json Object 생성 */
		function createJsonGrouplist() {
			var jsonObj = [];
			var jsonItem = {};
			
			jsonItem["groupId"] = "00000";
			jsonItem["codeId"] = $("#tblGroup").DataTable().rows(".selected").data()[0].groupId;
			
			jsonObj.push(jsonItem);
			
			return JSON.stringify(jsonObj);
		}
		
		/* 코드 Json Object 생성 */
		function createJsonCodelist() {
			var jsonObj = [];
			var oTable = $('#tblCode').dataTable();
			
			$('tbody :checkbox:checked', oTable).each(function(index) {
				var jsonItem = {};
				var aData = oTable.fnGetData($(this).closest('tr'));
				
				jsonItem['groupId'] = aData.groupId;
				jsonItem['codeId'] = aData.codeId;
				
				jsonObj.push(jsonItem);
			});
			
			return JSON.stringify(jsonObj);
		}
				
	});

/* ***References***
	DOM positioning: 
		http://datatables.net/examples/basic_init/dom.html
		
	Alternative pagination: 
		http://datatables.net/examples/basic_init/alt_pagination.html#
		
	Button options: 
		http://datatables.net/extensions/tabletools/button_options
		
	Flat array data source: 
		http://datatables.net/examples/ajax/custom_data_flat.html
		
	Deferred rendering for speed: 
		http://datatables.net/examples/ajax/defer_render.html
		
	Making row clickable except for the last column: 
		http://stackoverflow.com/questions/7525120
*/

</script>