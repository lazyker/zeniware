<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<h1 class="title">개설전체 커뮤니티</h1>
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
		<table id="cumtAll" class="table table-small-font table-striped table-bordered">
			<thead>
				<tr>
					<th>개설신청ID</th>
					<th>커뮤니티제목</th>
					<th>신청자</th>
					<th>신청일</th>
					<th>커뮤니티소개</th>
					<th>상태</th>
					<th>반려또는 수정일</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {

	var table = $('#cumtAll').DataTable({
//		ajax: {"url": "../community/getCumtAllListData?compId="+${compId}, "dataSrc": ""},
		ajax: {"url": "../community/getCumtAllListData", "dataSrc": ""},
		deferRender: true,
		pagingType: "simple_numbers",
		aoColumns: [
			{ "mData": "fcComtId", "visible" : false },
			{ "mData": "cumtNm" },
	      	{ "mData": "regUserId" },
	      	{ "mData": "regDate" },
	      	{ "mData": "cumtComment" },
	      	{ "mData": "admActYn" , "mRender" : function(data,type, full){
					if(data == 'Y') {
						return "사용중";
					} else if(data == 'N') {
						return "승인대기";
					} else if(data == 'P') {
						return "페쇄";
					} else if(data == 'R') {
						return "반려";
					}
				}
	      	},
			{ "mData": "modDate" }
		],
		//sDom: "<'row'<'col-sm-4'<'pull-left'T>><'col-sm-6'f><'col-sm-2'<'pull-right'l>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>",
		sDom: "<'row'<'col-sm-6'><'col-sm-6'<'pull-right'f>>>rt<'row'<'col-xs-9'i><'col-xs-3'p>>"
	});
});
</script>