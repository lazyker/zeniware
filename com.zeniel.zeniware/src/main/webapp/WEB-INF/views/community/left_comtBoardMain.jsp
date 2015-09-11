<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar-menu toggle-others">
	<div class="sidebar-menu-inner">
		<div class="panel2 panel-flat-custom">
			<div class="col-md-12" style="padding-left:0px; !importent">
				<div class="input-group">
					<span class="input-group-addon" onclick="fn_comtMain();"><i class="fa fa-chevron-left"></i></span>
					<%-- <input type="text" class="form-control" value="${comtInfo.CUMT_NM}" /> --%>
					<select id="comtInfo" name="comtInfo" class="form-control" style="padding:opx !important;" onchange="fn_comtVwCng(this.value)">
						<c:forEach items="${comtList}" var="listMap">
							<option value="${listMap.fcComtId}" <c:if test="${listMap.fcComtId == fcComtId}">selected</c:if> >${listMap.cumtNm}</option>
						</c:forEach>
					</select>
					<%-- <span class="input-group-addon" onclick="fn_comtView();"><i class="fa fa-angle-down"></i></span>
					<div id="comtView" style="display: none;">
						<c:forEach items="${comtList}" var="listMap">
							${listMap.cumtNm}
						</c:forEach>
					</div> --%>
					<span class="input-group-addon" onclick="fn_comtEdit('${comtInfo.FC_COMT_ID}')"><a href="javascript:void(0);"><i class="fa fa-edit"></i></a></span>
				</div>
			</div>
		</div>

		<ul id="main-menu" class="main-menu" style="padding-left:14px !important;">
			<li>
				<div class="vertical-top">
					<button class="btn btn-secondary btn-icon btn-icon-standalone btn-icon-standalone-right btn-block" id="comtBoardNewWrite">
						<i class="fa-pencil"></i>
						<span>글쓰기</span>
					</button>
				</div>
			</li>
			<li>
				<span>소속게시판</span>
			</li>
			<li style="color:#FFFFFF;">
				<i class="linecons-tag"></i><span class="title">생성된 게시판</span>
				<ul class="calendar-menu" style="display:block;padding-left:15px !important;">
				<c:forEach items="${boardInfoList}" var="bdInfolist" varStatus="status">
					<li style="color:#FFFFFF;">
						<i class="fa fa-cube"></i>
						<label>
						<a href="./comtBoardList?boardInfoId=<c:out value="${bdInfolist.boardInfoId}" />" style="padding:0px !important;">
						<c:out value="${bdInfolist.fcBoardTitle}" />
						</a>
						</label>
						<c:if test="${bdInfolist.lineGubun == '0'}">
							<c:if test="${bdInfolist.fcBoardMastYn == 'Y'}">
							<span class="pull-right hidden-collapsed">
							<a href="./comtBoardInfoEdit?boardInfoId=<c:out value="${bdInfolist.boardInfoId}" />" style="padding:0 !important;">
								<i class="fa fa-edit"></i>
							</a>
							</span>
							</c:if>
						</c:if>
					</li>
				</c:forEach>
			</ul>
			</li>
		</ul>
		<c:if test="${comtInfo.mastGubun == 'M' or comtInfo.mastGubun == 'B' }">
			<div class="panel panel-flat-custom">
				<div class="panel-body btn-icon-standalone-right" style="color:#FFFFFF !important;padding-right:5px;margin-right:2px;">
					<span style="color:#FFFFFF !important;"><a href="javascript:void(0);" onclick="fn_boardNewInfo('${fcComtId}')">게시판생성</a></span>
				</div>
			</div>
		</c:if>
	</div>
</div>

<script type="text/javascript">
function fn_comtView() {
	$('#comtView').show();
}

function fn_comtMain() {
	window.location.href =  getContextPath() + "/cumnity/comtMain";
}

function fn_comtEdit(fcComtId) {
	window.location.href =  getContextPath() + "/cumnity/comtInfoEdit?fcComtId=" + fcComtId;
}

function fn_comtVwCng(fcComtId) {
	window.location.href =  getContextPath() + "/cumnity/comtView?fcComtId=" + fcComtId;
}

function fn_boardNewInfo(fcComtId) {
	window.location.href =  getContextPath() + "/comtBoard/comtNewBoardWrite?fcComtId=" + fcComtId;
}
</script>