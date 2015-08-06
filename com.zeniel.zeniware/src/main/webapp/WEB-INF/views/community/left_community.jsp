<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<div class="sidebar-menu toggle-others fixed">

	<ul id="main-menu" class="main-menu" style="padding-left:14px !important;">
		<li>
			<a id="comtWrite" class="btn btn-gray btn-icon" style="width:100%;padding:0;">
			<i class="fa-link"></i>
			<span style="width:180px;">커뮤니티 만들기</span>
			</a>
		</li>
		<li style="color:#FFFFFF;">
			<i class="fa fa-comment-o"></i>
			<span class="title">가입 커뮤니티</span>
			<ul class="calendar-menu" style="display:block;padding-left:15px !important;">
				<c:forEach items="${comtlist}"  var="comtlist"  varStatus="status">
					<li style="color:#FFFFFF;">
						<i class="fa fa-cube"></i>
						<label>
						<a href="./comtView?fcComtId=<c:out value="${comtlist.fcComtId}" />" style="padding:0px !important;">
						<c:out value="${comtlist.cumtNm}" />
						</a>
						</label>
						<span style="font-size:8px;">
							<c:if test="${comtlist.joinYn == 'Y'}">
							<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${comtlist.joinYn == 'N'}">
							(가입대기)&nbsp;
							</c:if>
						</span>
						<c:if test="${comtlist.mastGubun != 'U'}">
						<span class="pull-right hidden-collapsed">
						<a href="./comtInfoEdit?fcComtId=<c:out value="${comtlist.fcComtId}" />" style="padding:0 !important;">
							<i class="fa fa-edit"></i>
						</a>
						</span>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</li>
	</ul>
	
</div>