<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<h1 class="title">개설신청 커뮤니티</h1>
		<p class="description">Dynamic table variants with pagination and other controls</p>
	</div>
	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="${pageContext.request.contextPath}/admin/"><i class="fa-home"></i>Home</a></li>
			<li><a href="#">Community</a></li>
			<li class="active"><strong>Basic Setup</strong></li>
		</ol>
	</div>
</div>
<div class="panel panel-default">
	<div class="panel-body">
		<table id="cumtInfo" class="table table-small-font table-striped table-bordered">
			<thead>
				<tr>
					<th class="no-sorting"><input type="checkbox" class="cbr"></th>
					<th>커뮤니티제목</th>
					<th>신청자</th>
					<th>신청일</th>
					<th>커뮤니티소개</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var table = $('#cumtInfo').DataTable({
		ajax: {"url": "./getCumtList?compId=001", "dataSrc": ""},
		deferRender: true,
		pagingType: "simple_numbers",
		aoColumns: [
			{ "mRender": function(data, type, full) { return '<input type="checkbox" class="cbr">'; } },
			{ "mData": "fcBordId" },
	      	{ "mData": "fcAdmSeq" },
	      	{ "mData": "compId" },
	      	{ "mData": "cumtNm" },
	      	{ "mData": "cumtComent" },
	      	{ "mData": "admOpenYn" },
	      	{ "mData": "openYn" },
	      	{ "mData": "regDate" },
	      	{ "mData": "modDate" },
	      	{ "mData": "regUserId" },
	      	{ "mData": "modUserId" }
		],
		sDom: "<'row'<'col-sm-4'<'pull-left'T>><'col-sm-6'f><'col-sm-2'<'pull-right'l>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>",
		oTableTools: {
			"aButtons": [
				{
					"sExtends": "text",
					"sButtonClass": "btn-primary",
					"sButtonText": "개설신청 수락",
					"fnClick": function(nButton, oConfig, oFlash) {
						$(location).attr('href', 'newCode');
					}
				},
				{
					"sExtends": "text",
					"sButtonClass": "btn-primary",
					"sButtonText": "개설신청 반려",
					"fnClick": function(nButton, oConfig, oFlash) {
						$("#cumtInfo tbody tr").each(function() {
							var curChecked = $("input[type='checkbox']:checked", this).length;

							if (curChecked == 1) $(this).addClass('selected');
							else $(this).removeClass('selected');
						});

						table.rows('.selected').remove().draw(false);
					}
				}
			]
		},
		fnDrawCallback: function() {
			clickRowHandler();
		}
	});
});
</script>