<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">공통 코드 관리</h1>
		<p class="description">Dynamic table variants with pagination and other controls</p>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="dashboard-1.html"><i class="fa-home"></i>Home</a></li>
			<li><a href="tables-basic.html">Tables</a></li>
			<li class="active"><strong>Data Tables</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">
	<div class="col-sm-4">
	
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<h3 class="panel-title">코드그룹</h3>
			</div>
			
			<div class="panel-body">
				<div class="form-group">
					<div class="btn-group">
						<button class="btn btn-primary" id="btnGroupAdd">New</button>
						<button class="btn btn-secondary" id="btnGroupEdit">Edit</button>
						<button class="btn btn-primary" id="btnGroupDelete">Delete</button>
					</div>
					<select class="form-control" id="sboxit">
						<option>그룹코드를 선택하세요.</option>
					</select>
				</div>
			</div>
		
		</div>
	
	</div>
	
	<div class="col-sm-8">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">코드정보</h3>
			</div>
			
			<div class="panel-body">
				<table id="example" class="table table-small-font table-striped table-bordered">
					<thead>
						<tr>
							<th class="no-sorting"><input type="checkbox" class="cbr"></th>
							<th>그룹ID</th>
							<th>코드ID</th>
		 					<th>코드명(Ko)</th>
							<th>코드명(En)</th>
							<th>코드명(Cn)</th>
							<th>코드명(Jp)</th>
							<th>정렬순서</th>
							<th>사용여부</th>
						</tr>
					</thead>
				</table>
			</div>
		
		</div>
	
	</div>
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		/* Modal Dialog Config */
		$("#modl h4").html("공통코드 삭제");
		$("#modlBody").html("삭제하시겠습니까?");
		$("#btnOk").html("저장");
		$("#btnCancel").html("취소");

		var sboxit = $("#sboxit").selectBoxIt({
			showEffect: 'fadeIn', 
			hideEffect: 'fadeOut', 
			showFirstOption: false, 
			populate: function() {
				var deferred = $.Deferred(), arr = [], x = -1;
				
				$.ajax({
					url: '../ajax/getGrouplist', 
					type: 'POST', 
					data: 'groupId=00000', 
					dataType: 'json'
				}).done(function(data) {
					deferred.resolve(data);
					
					var groupId = "${groupId}";
					
					if (groupId != "" && groupId != "00000")
						sboxit.selectBoxIt('selectOption', groupId);
				});
				
				return deferred;
			}
		});

		var table = $('#example').DataTable({
			ajax: {"url": "../ajax/getCodelist", "dataSrc": ""}, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
        { "mRender": function(data, type, full) { return '<input type="checkbox" class="cbr">'; } }, 
      	{ "mData": "groupId" }, 
      	{ "mData": "codeId" }, 
      	{ "mData": "codeNameKo" }, 
      	{ "mData": "codeNameEn" }, 
      	{ "mData": "codeNameCn" }, 
      	{ "mData": "codeNameJp" }, 
      	{ "mData": "sortOrder" }, 
      	{ "mData": "useYn" } 
      ], 
 			//sDom: "<'row'<'col-sm-3'<'pull-left'T>><'col-sm-6'f><'col-sm-3'<'pull-right'l>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>",
 			sDom: "<'row'<'col-sm-6'<'pull-left'T>><'col-sm-6'<'pull-right'f>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>", 
			oTableTools: {
				"aButtons": [
					{ 
						"sExtends": "text", 
						"sButtonClass": "btn-primary",
						"sButtonText": "New", 
						"fnClick": function(nButton, oConfig) {
							$(location).prop('href', 'newCode?groupId=' + $("#sboxit").val());
						}
					}, 
					{
						"sExtends": "text", 
						"sButtonClass": "btn-primary", 
						"sButtonText": "Delete",  
						"fnClick": function(nButton, oConfig) {
							if (getCodelistCount() > 0) {
								jQuery('#modl').modal('show', {backdrop: 'fade'});
								$("#btnOk").addClass('deleteCode');
							} else {
								toastr.options.closeButton = true;
								toastr.options.positionClass = "toast-top-full-width";
								toastr.error("<div align='center'><b>최소 1개 이상의 코드를 선택하세요.</b></div>", null);
							}
						}
					}
				]
			}
		});
		
		$("#btnGroupAdd").on('click', function() {
			$(location).prop('href', 'newCode?groupId=00000');
		});
		
		$("#btnGroupEdit").on('click', function() {
			$(location).attr('href', 'newCode?groupId=00000&codeId=' + $("#sboxit").val());
		})
		
		$("#btnGroupDelete").on('click', function(event) {
			if ($("#sboxit").val() != null) {
					jQuery("#modl").modal('show', {backdrop: 'fade'});
					$("#btnOk").addClass('deleteGroup');
			} else {
 				event.preventDefault();
				
 				toastr.options.closeButton = true;
 				toastr.options.positionClass = "toast-top-full-width";
				toastr.error("<div align='center'><b>삭제할 코드그룹을 선택하세요.</b></div>", null);
			}
		});
		
		// Delete Button OnClick Event
		$("#btnOk").on('click', function() {
			if ($(this).hasClass("deleteGroup")) {
				$.ajax({
					dataType: "json", 
					type: "POST", 
					url: "../ajax/deleteCodelist", 
					data: { codelist: createJsonGrouplist() }, 
					success: function(data) {
						$(location).prop('href', 'codeMainFlat')
					}
				});
			} else {
				$.ajax({
					dataType: "json", 
					type: "POST", 
					url: "../ajax/deleteCodelist", 
					data: { codelist: createJsonCodelist() }, 
					success: function(data) {
						$("#modl").modal("hide");
						table.rows(".selected").remove().draw(false);
					} 
				});
			}
		});
		
		// SelectBoxIt OnChange Event
		$("#sboxit").on("change", function() {
			table.ajax.url('../ajax/getCodelist?groupId=' + $(this).val()).load();
		});
		
		// Table Row OnClick Event
		$("#example tbody").on('click', 'tr td:not(:first-child)', function() {
			var groupId = $(this).parent().find('td').eq(1).text();
			var codeId = $(this).parent().find('td').eq(2).text();

			$(location).attr('href', 'newCode?groupId=' + groupId + '&codeId=' + codeId);
		});
		
		// Checkbox OnChange Event
		$("#example tbody").on('change', "tr td:first-child input[type='checkbox']", function() {
				if ($(this).is(':checked'))
					$(this).parents('tr').addClass('selected');
				else
					$(this).parents('tr').removeClass('selected');
		});
		
		var $state = $("#example thead input[type='checkbox']");
		
		$("#example").on('draw.dt', function() {
			cbr_replace();
			$state.trigger('change');
		});
		
		$state.on('change', function(ev) {
			var $chcks = $("#example tbody input[type='checkbox']");
			
			if ($state.is(':checked')) {
				$chcks.prop('checked', true).trigger('change');
			} else {
				$chcks.prop('checked', false).trigger('change');
			}
		});
		
		function createJsonGrouplist() {
			var jsonObj = [];
			var jsonItem = {};
			
			jsonItem["groupId"] = "00000";
			jsonItem["codeId"] = sboxit.val();
			
			jsonObj.push(jsonItem);
			
			return JSON.stringify(jsonObj);
		}
		
		function createJsonCodelist() {
			var jsonObj = [];

			$("#example tbody tr").each(function() {
				var chked = $("input[type='checkbox']:checked", this).length;
				
				if (chked == 1) {
					var jsonItem = {};
					
					jsonItem["groupId"] = $('td', this).eq(1).text();
					jsonItem["codeId"] = $('td', this).eq(2).text();
					
					jsonObj.push(jsonItem);
				}
			});
			
			return JSON.stringify(jsonObj);
		}
		
		function getCodelistCount() {
			var cnt = 0;
			
			$("#example tbody tr").each(function() {
				cnt+= $("input[type='checkbox']:checked", this).length;
			})
			
			return cnt;
		}
		
		
		
	});

/* ***References***
	DOM positioning: http://datatables.net/examples/basic_init/dom.html
	Alternative pagination: http://datatables.net/examples/basic_init/alt_pagination.html#
	Button options: http://datatables.net/extensions/tabletools/button_options
	Flat array data source: http://datatables.net/examples/ajax/custom_data_flat.html
	Deferred rendering for speed: http://datatables.net/examples/ajax/defer_render.html
	Making row clickable except for the last column: http://stackoverflow.com/questions/7525120
*/

</script>