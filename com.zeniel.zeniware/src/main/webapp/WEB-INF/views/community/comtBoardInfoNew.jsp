<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<%-- <h1 class="title">${comtInfo.CUMT_NM}</h1> --%>
		<h1 class="title">게시판 추가</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="${pageContext.request.contextPath}/"><i class="fa-home"></i>Home</a></li>
			<li><a href="./comtMain">Community</a></li>
			<li><a href="../cumnity/comtView?fcComtId=${fcComtId}">Community View</a></li>
		</ol>
	</div>
</div>

<form role="form" class="validate form-horizontal" id="form" method="POST">
<div class="row">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<div class="row">
					<div class="col-sm-2">
						<span class="title">위치</span>
					</div>
					<div class="col-md-6">
						<select id="comtInfoId">
							<option value="IDLGA0WF0000002">test11</option>
							<option value="IDLGA5KW0000003">test22</option>
						</select>
					</div>
					<div class="col-sm-3">
					</div>
				</div>
			</div>
			<div class="form-group-separator"></div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-2">
						<span class="title">제목</span>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" maxlength="100" placeholder="Board Title Input text">
					</div>
				</div>
			</div>
			<div class="form-group-separator"></div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-2">
						<span class="title">설명</span>
					</div>
					<div class="col-sm-9">
						<textarea class="form-control autogrow" name="boardComment" id="boardComment" rows="5" placeholder="Could be used also as Board Comment"></textarea>
					</div>
				</div>
			</div>
			<div class="form-group-separator"></div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-2">
						<span class="title">유형</span>
					</div>
					<div class="col-sm-10">
						<div class="form-block">
							<label>
								<input type="radio" name="boardType" value="B" class="cbr cbr-success" checked>
								클래식
							</label>
							<label>
								<input type="radio" name="boardType" value="P" class="cbr cbr-success">
								피드
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>