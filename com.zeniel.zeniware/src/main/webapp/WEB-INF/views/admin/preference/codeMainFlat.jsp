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
<div>양초이엔찡따오</div>
<div class="row">
	<div class="col-sm-4">
	
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<h3 class="panel-title">코드그룹</h3>
			</div>
			
			<div class="panel-body">
				<div class="form-group">
					<label class="control-label"></label>
					<select class="form-control" id="sboxit">
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
							<th>상위그룹ID</th>
		 					<th>코드명(Ko)</th>
							<th>코드명(En)</th>
							<th>코드명(Cn)</th>
							<th>코드명(Jp)</th>
							<th>정렬순서</th>
							<th>사용여부</th>
							<th>상세설명</th>
							<th>등록일시</th>
							<th>변경일시</th>
						</tr>
					</thead>
				</table>
			</div>
		
		</div>
	
	</div>
</div>

<script type="text/javascript">

	$(document).ready(function() {

		var sboxit = $("#sboxit").selectBoxIt({
			showEffect: 'fadeIn', 
			hideEffect: 'fadeOut', 
			defaultText: 'Select your code group...', 
			populate: function() {
				var deferred = $.Deferred(), arr = [], x = -1;
				
				$.ajax({
					url: '../ajax/getGrouplist', 
					type: 'POST', 
					data: 'groupId=B0000', 
					dataType: 'json'
				}).done(function(data) {
					deferred.resolve(data);
				});
				
				return deferred;
			}
		});

		var table = $('#example').DataTable({
			ajax: {"url": null, "dataSrc": ""}, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
        { "mRender": function(data, type, full) { return '<input type="checkbox" class="cbr">'; } }, 
      	{ "mData": "groupId" }, 
      	{ "mData": "codeId" }, 
      	{ "mData": "parentGroupId", "bVisible": false }, 
      	{ "mData": "codeNameKo" }, 
      	{ "mData": "codeNameEn" }, 
      	{ "mData": "codeNameCn" }, 
      	{ "mData": "codeNameJp" }, 
      	{ "mData": "sortOrder" }, 
      	{ "mData": "useYn" }, 
      	{ "mData": "description", "bVisible": false }, 
      	{ "mData": "regDate", "bVisible": false }, 
      	{ "mData": "modDate", "bVisible": false }
      ], 
 			sDom: "<'row'<'col-sm-3'<'pull-left'T>><'col-sm-6'f><'col-sm-3'<'pull-right'l>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>", 
			oTableTools: {
				"aButtons": [
					{ 
						"sExtends": "text", 
						"sButtonClass": "btn-primary",
						"sButtonText": "New", 
						"fnClick": function(nButton, oConfig, oFlash) {
							$(location).attr('href', 'newCode');
						}
					}, 
					{
						"sExtends": "text", 
						"sButtonClass": "btn-primary", 
						"sButtonText": "Delete", 
						"fnClick": function(nButton, oConfig, oFlash) {
							$("#example tbody tr").each(function() {
								var curChecked = $("input[type='checkbox']:checked", this).length;
								
								if (curChecked == 1) $(this).addClass('selected');
								else $(this).removeClass('selected');
							});
							
							
							table.rows('.selected').remove().draw(false);
						}
					}
				]
			}
		});
		
		$("#sboxit").on("change", function() {
			table.ajax.url('../ajax/getCodelist?groupId=' + $(this).val()).load();
		});
		
		$("#example tbody").on('click', 'tr td:not(:first-child)', function() {
			
		});
		
		$("#example tbody").on('click', 'tr td:not(:first-child)', function() {
			var groupId = $(this).parent().find('td').eq(1).text();
			var codeId = $(this).parent().find('td').eq(2).text();

			$(location).attr('href', 'newCode?groupId=' + groupId + '&codeId=' + codeId);
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