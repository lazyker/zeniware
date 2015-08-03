<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title" style="padding:10px 0 !important;">
	<div class="title-env">
		<h1 class="title">커뮤니티</h1>
	</div>
	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="${pageContext.request.contextPath}/"><i class="fa-home"></i>Home</a></li>
			<li><a href="./comtMain">Community</a></li>
		</ol>
	</div>
</div>
<section class="mailbox-env">
	<div class="row">
		<div class="col-sm-12 mailbox-right">
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#all" data-toggle="tab">최신글</a>
				</li>
				<li>
					<a href="#admComtList" data-toggle="tab">개설된 커뮤니티 목록</a>
				</li>
			</ul>

			<div class="mail-single">
				<div class="tab-content">
					<div class="tab-pane active" id="all">
						<!-- <div class="mail-single-header">
							<h2>최신글</h2>
						</div> -->
						<div class="mail-single-reply">
							<div class="fake-form">
								<div>
									커뮤니티에 게시된 글이 하나도 없습니다.
								</div>
							</div>
						</div>
						<br />
						<div class="mail-single-reply">
							<a href="./comtBoardView?fcBoardId=2">
							<div class="col-sm-10 mailbox-right">
								제목 나오는곳 <br />
								최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치
							</div>
							</a>
							<a href="#" class="thumb">
							<img src="${pageContext.request.contextPath}/assets/images/attach-1.png" width="120" height="150" class="img-thumbnail" />
							</a>
							<div class="mailbox-right">
								2015-07-28
							</div>
							<h5>${memberInfo.userNm}</h5>
						</div>
						<br />
						<div class="mail-single-reply">
							<div class="col-sm-10 mailbox-right">
								최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치 최신글이 나오도록 호과적으로 배치
								dssfsf sdshdhdhdhdhdhhhhhhhsewrfwfshfhfweh
							</div>
							<a href="#" class="thumb">
							<img src="${pageContext.request.contextPath}/assets/images/attach-1.png" width="120" height="150" class="img-thumbnail" />
							</a>
							<div class="mailbox-right">
								2015-07-28
							</div>
							<h5>${memberInfo.userNm}</h5>
						</div>
					</div>

					<div class="tab-pane" id="admComtList">
						<table id="comtAllList" class="table table-small-font table-striped table-bordered">
							<thead>
								<tr>
									<th>커뮤니티ID</th>
									<th>커뮤니티명</th>
									<th>운영자</th>
									<th>가입인원</th>
									<th>가입여부</th>
									<th>생성일</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
$(document).ready(function() {
	var msg01 = "커뮤니티 삭제";
	var msg02 = "삭제하시겠습니까?";
	var msg03 = "가입하시겠습니까?";
	var msg04 = "취소";
	var msg05 = "확인";
	var msg06 = "취소";

	$('#comtAllList').DataTable({
		ajax: { "url": "./getComtAllList", "dataSrc": "" }, 
		deferRender: true, 
		pagingType: "simple_numbers", 
		aoColumns: [
			{ "mData": "fcComtId", "visible" : false },
			{ "mData": "cumtNm" },
			{ "mData": "userNm" },
			{ "mData": "talNum" },
			{ "mData": "joinYn" },
			{ "mData": "regDate" }
		],
		sDom: "<'row'<'col-sm-6'l><'col-sm-6'<'pull-right'f>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
//		sDom: "<'row'<'col-sm-6'<'pull-left'T>><'col-sm-6'<'pull-right'f>>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
	});

	$("#comtAllList tbody").on('click', "tr td", function() {
		alert("호출11");
	});
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