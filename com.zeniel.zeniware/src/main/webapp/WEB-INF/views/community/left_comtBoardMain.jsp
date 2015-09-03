<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar-menu toggle-others">
	<div class="sidebar-menu-inner">
		<div class="panel panel-flat-custom">
			<div class="panel-body">
				<div class="vertical-top">
					<span>커뮤니티</span>
				</div>
			</div>
		</div>

		<ul id="main-menu" class="main-menu" style="padding-left:14px !important;">
			<li>
				<div class="vertical-top">
					<button class="btn btn-secondary btn-icon btn-icon-standalone btn-icon-standalone-right btn-block">
						<i class="fa-pencil"></i>
						<span id="comtBoardWrite">글쓰기</span>
					</button>
				</div>
			</li>
			<li>
				<a id="comtBoardWrite" class="btn btn-gray btn-icon" style="width:100%;padding:0;">
				<i class="fa-link"></i>
				<span style="width:180px;">게시판 생성</span>
				</a>
				<div class="vertical-top">
					<button class="btn btn-secondary btn-icon btn-icon-standalone btn-icon-standalone-right btn-block">
						<i class="fa-pencil"></i>
						<span id="comtBoardWrite">글쓰기</span>
					</button>
				</div>
			</li>
			<li style="color:#FFFFFF;">
				<i class="linecons-tag"></i><span class="title">생성된 게시판</span>
			</li>
		</ul>
	</div>
</div>