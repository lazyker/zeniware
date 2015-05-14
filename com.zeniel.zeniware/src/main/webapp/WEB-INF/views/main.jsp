<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="zeniware.common.login.MemberInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();

    Object principal = auth.getPrincipal();
    String name = "";

    if (principal != null && principal instanceof MemberInfo) {
        name = ((MemberInfo) principal).getName();
    }
%>

<!DOCTYPE html>
<html>
<head>
	<title>그룹웨어</title>
	<link type="text/css" rel="stylesheet" href="resources/css/common_style.css" />
    <link type="text/css" rel="stylesheet" href="resources/css/layout.css" />
</head>
<body>
	<!--상단시작-->
    <div id="wrapper">
    	<h1><a href="index.html" title="">제니엘그룹웨어</a></h1>
        <div class="nav">
            <ul class="menu">
                <li><a href="">전자우편</a></li>
                <li><a href="">일정관리</a></li>
                <li><a href="">전자결재</a></li>
                <li><a href="">업무관리</a></li>
                <li><a href="">커뮤니티</a></li>
                <li><a href="">자원관리</a></li>
                <li><a href="">문서관리</a></li>
                <li><a href="">주소록</a></li>
            </ul>
        </div>
        <div class="my">
            <img src="resources/images/main/photo.png" />
            <span class="bell"><a href="" title="알림">03</a></span>
            <span class="gra"><a href="" title="현황">현황</a></span>
            <span class="modi"><a href="" title="환경설정">설정</a></span>
            <sec:authorize access="hasRole('admin')">
                    관리자
            </sec:authorize>
            <span class="out"><a href="" title="로그아웃">로그아웃</a></span>
        </div>
    </div>
    <!--상단끝-->
    <!--좌측시작-->
	<div id="inb">
        <div class="title">
        전자우편
        </div>
    	<!--메뉴리스트시작-->
    	<div class="tree">
            <div class="new">
                <p class="m_write"><a href=""><span class="new_ic"><img src="resources/images/main/ic_new.png" /></span>메일쓰기</a></p>
            </div>
            <div class="b_m">
            메일함
                <div class="fr mr10 pt5">
                    <span class="m_set"><a href="" title="메뉴셋팅">메뉴셋팅</a></span>
                    <span class="m_skip"><a href="" title="접기">메뉴접기</a></span>
                </div>
            </div>
            <ul class="s_me">
                <li><a href=""><span class="sm_ic"><img src="resources/images/main/ic_fmail.png" /></span>받은메일함<em>02</em></a></li>
                <li><a href=""><span class="sm_ic"><img src="resources/images/main/ic_smail.png" /></span>보낸메일함</a></li>
                <li><a href=""><span class="sm_ic"><img src="resources/images/main/ic_delmail.png" /></span>지운메일함</a></li>
            </ul>
    		<div class="b_f">
            자주쓰는 메뉴
            <div class="fr mr10 pt5">
            	<span class="m_set"><a href="">메뉴셋팅</a></span>
            	<span class="m_skip"><a href="">메뉴접기</a></span>
            </div>
    		</div>
        	<!--하단검색시작-->
            <div class="mem_search">
                <input type="text" class="in" placeholder="이름, 부서, 전화" style="width:185px; height:25px;" />
                <span class="btn_sr"><a href="" title="조직도보기">결과보기</a></span>
            </div>
            <!--하단검색끝-->
    	</div>
    	<!--메뉴리스트끝-->
	</div>
    <!--좌측끝-->
        <!--숨김버튼시작
        <div class="hidden">
        <a href="">숨기기</a>
        </div>
        <!--숨김버튼끝
    <!--컨텐츠시작-->
    <div id="Contents">
        <div id="subContents">
            <p class="title">받은메일함
                <!--검색시작-->
                <span class="allb">         	
                    <select name="" class="sel01" style="width:80px; height:21px; margin-right:0px;">
                    <option>통합검색</option>
                    <option>전자우편</option>
                    </select>
                    <input type="text" class="in_sea" style="width:130px; height:23px;" /><button type="button">검색</button>
                </span>
                <!--검색끝-->
            </p>
        </div>
        ${pageContext.request.contextPath}
    </div>
    <!--컨텐츠끝-->
</body>
</html>