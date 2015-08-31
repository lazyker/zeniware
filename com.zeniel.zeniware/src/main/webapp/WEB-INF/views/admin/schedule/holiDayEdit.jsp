<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="col-sm-12">
	
		<div class="panel panel-default">
			<div class="panel-heading">
			<c:set var="id" value="${param.hldyId}" />
			<c:choose>
				<c:when test="${empty id}">
					<h3 class="panel-title">공휴일 등록</h3>
				</c:when>
				<c:otherwise>
					<h3 class="panel-title">공휴일 수정</h3>
				</c:otherwise>
				
			</c:choose>
			</div>
			
			<div class="panel-body">
				<form role="form" id="frm" class="form-horizontal validate" method="post">
				<sec:authentication var="user" property="principal" />
				<input type="hidden" name="compId" value="${user.compId}"/>
			<c:if test="${!empty id}">
				<input type="hidden" name="hldyId" value="${param.hldyId}"/>
			</c:if>
				
					<div class="form-group">
						<label class="col-sm-1 control-label">휴일 이름</label>
						
						<div class="col-sm-11">
							<input type="text" class="form-control" name="hldyNm" data-validate="required" data-message-required="데이터를 입력해주세요." 
							value='<c:out value="${param.hldyNm}"></c:out>' />
							
						</div>
						
					</div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label">휴일 날짜</label>
						
						<div class="col-sm-5">
							<input type="text" class="form-control datepicker" name="hldyYmd" id="hldyYmd" data-format="yyyy-mm-dd" data-validate="required" 
								data-message-required="날짜를 입력해주세요." value='<c:out value="${param.hldyYmd}"></c:out>' />
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12 align-center">
							<button type="button" class="btn btn-turquoise" id="btnSave">저장</button>
						<c:if test="${!empty id}">
							<button type="button" class="btn btn-turquoise" id="btnDel">삭제</button>
						</c:if>
							<button type="button" class="btn btn-gray" id="btnCancel" >취소</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	
	</div>
</div>
	
	<script>
	
		$(document).ready(function() {
			
			$('#btnSave').on('click', function() {
				if ('${id}' == '')
					$('form').prop('action', './setHoliDay').submit();
				else
					$('form').prop('action', './modHoliDay').submit();
			});
			
			$('#btnDel').on('click', function() {
				if (confirm("삭제 하시겠습니까?")) {
					$('form').prop('action', './delHoliDay').submit();
				}
			});
			
			$("#btnCancel").on('click', function(e) {
				$(location).prop('href', 'javascript:history.go(-1)');
			});
			
		}); //ready End
		
	</script>