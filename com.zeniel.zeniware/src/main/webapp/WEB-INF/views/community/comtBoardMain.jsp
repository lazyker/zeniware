<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<%-- <h1 class="title">${comtInfo.CUMT_NM}</h1> --%>
		<h1 class="title">커뮤니티 글</h1>
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
	<c:choose>
		<c:when test="${total =='0'}">
			<div class="mail-single">
				<div class="fake-form">
					<div class="form-group text-center">
						커뮤니티에 게시된 글이 하나도 없습니다.
					</div>
					<br />
					<div class="form-group text-center">
						<button class="btn btn-secondary btn-icon" id="btnNew">새글 작성하기</button>
					</div>
				</div>
			</div>
		</c:when>
		<c:when test="${total != 0}">
			<c:forEach items="${comtBdList}" var="comtBdListMap">
				<div class="mail-single-reply">
					<a href="./comtBoardView?fcBoardId=2">
					<div class="col-sm-10 mailbox-right">
						${comtBdListMap.userNm} ${comtBdListMap.deptNm} ${comtBdListMap.fcFullComtBdTitle}<br />
						${comtBdListMap.title}<br />
						${comtBdListMap.contents}
					</div>
					</a>
					<a href="#" class="thumb">
						<img src="${pageContext.request.contextPath}/assets/images/attach-1.png" width="80" height="80" alt='user-pic' class="img-circle">
					</a>
					<div class="mail-single-reply2 mailbox-right">
						${comtBdListMap.regDate}
					</div>
					<h5 style="padding-left:20px;">${memberInfo.userNm}</h5>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
	</div>
</section>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnNew").on("click",  function() {
		alert('중비중입니다');
		$(location).prop('href', '../comtBoard/comtBoardWrite?fcComtId=${fcComtId}');
	});
});

function fn_menView(id) {
	alert(id);
}
</script>