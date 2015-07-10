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

<div class="panel panel-default">
<!-- 	<div class="panel-heading"> -->
<!-- 		<h3 class="panel-title">공통 코드 관리</h3> -->
<!-- 	</div> -->
	
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

<script type="text/javascript">

	$(document).ready(function() {
		var table = $('#example').DataTable({
			ajax: {"url": "../ajax/getCodelist?groupId=00000", "dataSrc": ""}, 
			deferRender: true, 
			pagingType: "simple_numbers", 
			aoColumns: [
        { "mRender": function(data, type, full) { return '<input type="checkbox" class="cbr">'; } }, 
      	{ "mData": "groupId" }, 
      	{ "mData": "codeId" }, 
      	{ "mData": "parentGroupId" }, 
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
 			sDom: "<'row'<'col-sm-4'<'pull-left'T>><'col-sm-6'f><'col-sm-2'<'pull-right'l>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>", 
			oTableTools: {
				"aButtons": [
					{ 
						"sExtends": "text", 
						"sButtonClass": "btn-primary",
						"sButtonText": "Create New", 
						"fnClick": function(nButton, oConfig, oFlash) {
							$(location).attr('href', 'newCode');
						}
					}, 
					{
						"sExtends": "text", 
						"sButtonClass": "btn-primary", 
						"sButtonText": "Delete Selection", 
						"fnClick": function(nButton, oConfig, oFlash) {
							$("#example tbody tr").each(function() {
								var curChecked = $("input[type='checkbox']:checked", this).length;
								
								if (curChecked == 1) $(this).addClass('selected');
								else $(this).removeClass('selected');
							});
							
							table.rows('.selected').remove().draw(false);
						}
					}, 
					{
						"sExtends": "text", 
						"sButtonClass": "btn-primary", 
						"sButtonText": "Parent Group", 
						"fnClick": function(nButton, oConfig, oFlash) {
							table.ajax.url('../ajax/getCodelist?groupId=' + table.row(0).data().parentGroupId).load();
						}
					}
				]
			}, 
			fnDrawCallback: function() {
				clickRowHandler();
			}
		});
		
// 		$("#example tbody").on('click', 'tr td:not(:first-child)', function() {
// 			alert('aaa');
// 		});

		function clickRowHandler() {
			
			
// 			$("#example tbody").on('click', 'tr td:not(:first-child)', function() {
// 				table.ajax.url('../ajax/getCodelist?groupId=' + $(this).parent().find('td').eq(2).text()).load();
// 			});
			$("#example tbody").on('click', 'tr td:not(:first-child, :last-child)', function() {
				alert('dblclick');
			});
			
			$("#example tbody").on('click', 'tr dt(:last-child)', function() {
				//table.ajax.url('../ajax/getCodelist?groupId=' + $(this).parent().find('td').eq(2).text()).load();
				alert('click');
			});
			
			
		}
		
		
		
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