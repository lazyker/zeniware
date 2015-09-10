<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="col-sm-12">
	
		<div class="panel panel-default">
			<div class="panel-heading">
			<sec:authentication var="user" property="principal" />
			<c:set var="custSeq" value="${custVo.custSeq}" />
			<c:choose>
				<c:when test="${empty custSeq}">
					<h3 class="panel-title">고객사 등록</h3>
				</c:when>
				<c:when test="${modState eq 'Y'}">
						<h3 class="panel-title">고객사 수정</h3>
					</c:when>
				<c:otherwise>
					<h3 class="panel-title">고객사 정보</h3>
				</c:otherwise>
			</c:choose>
			</div>
			
			<div class="panel-body">
				<form role="form" id="frm" class="form-horizontal validate" method="post">
				<input type="hidden" name="userId" value="${custVo.userId}"/>
				<input type="hidden" name="compId" value="${custVo.compId}"/>
			<c:if test="${!empty custSeq}">
				<input type="hidden" name="custSeq" value="${custSeq}"/>
			</c:if>
			
			<c:choose>
				<c:when test="${empty custSeq || modState eq 'Y'}">
					<div class="form-group">
							<label class="col-sm-1 control-label" style="padding-top:-7px">거래처명</label>
							
							<div class="col-sm-11">
								<input type="text" class="form-control" name="custNm" value='<c:out value="${custVo.custNm}"></c:out>' />
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">대표자</label>
							
							<div class="col-sm-5">
								<input type="text" class="form-control" name="custDegt" value='<c:out value="${custVo.custDegt}"></c:out>' />
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">법인번호</label>
							
							<div class="col-sm-11">
								<input type="text" class="form-control" name="custCorpn" value='<c:out value="${custVo.custCorpn}"></c:out>' />
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">사업자번호</label>
							
							<div class="col-sm-11">
								<input type="text" class="form-control" name="custLices" value='<c:out value="${custVo.custLices}"></c:out>' />
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">업종</label>
							
							<div class="col-sm-11">
								<input type="text" class="form-control" name="custTypeNm" value='<c:out value="${custVo.custTypeNm}"></c:out>' />
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">E-Mail</label>
							
							<div class="col-sm-11">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										<i class="linecons-mail"></i>
									</span>
									<input type="text" class="form-control"  name="mailId" data-mask="email" value='<c:out value="${custVo.mailId}"></c:out>' />
								</div>
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">대표전화</label>
							
							<div class="col-sm-11">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										<i class="linecons-mobile"></i>
									</span>
									<input type="text" class="form-control"  name="phone" data-mask="999-9999-9999" value='<c:out value="${custVo.phone}"></c:out>' placeholder="phone" />
								</div>
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">FAX</label>
							
							<div class="col-sm-11">
								<input type="text" class="form-control"  name="fax" data-mask="999-9999-9999" value='<c:out value="${custVo.fax}"></c:out>' placeholder="fax" />
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">사업장 주소</label>
							
							<div class="col-sm-11">
								<input type="text" class="form-control" name="address" value='<c:out value="${custVo.address}"></c:out>' />
								
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
						<div class="form-group">
							<label class="col-sm-1 control-label">고객사 정보</label>
							
							<div class="col-sm-11">
								<input type="text" class="form-control" name="custInfo" value='<c:out value="${custVo.custInfo}"></c:out>' />
								
							</div>
						</div>
						
						<div class="form-group-separator"></div>
						
					<div class="row">
						<div class="col-md-12 align-center">
							<button type="button" class="btn btn-turquoise" id="btnSave">저장</button>
							<button type="button" class="btn btn-gray" id="btnCancel">취소</button>
							<button type="button" class="btn btn-gray" id="btnList">목록</button>
						</div>
					</div
				</c:when>
				
				<c:otherwise>
				<!-- 읽기 화면 -->
					<div class="form-group">
						<label class="col-sm-1 control-label2">거래처명</label>
						<div class="col-sm-11">
<!-- 							<i class="fa-ellipsis-v read"></i> -->
							<p><c:out value="${custVo.custNm}"></c:out></p>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">대표자</label>
						
						<div class="col-sm-5">
							<p><c:out value="${custVo.custDegt}"></c:out></p>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">법인번호</label>
						
						<div class="col-sm-11">
							<p><c:out value="${custVo.custCorpn}"></c:out></p>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">사업자번호</label>
						
						<div class="col-sm-11">
							<p><c:out value="${custVo.custLices}"></c:out></p>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">업종</label>
						
						<div class="col-sm-11">
							<p><c:out value="${custVo.custTypeNm}"></c:out></p>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">E-Mail</label>
						
						<div class="col-sm-11">
							<p><c:out value="${custVo.mailId}"></c:out></p>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">대표전화</label>
						
						<div class="col-sm-11">
							<div class="input-group input-group-sm input-group-minimal">
								<p><c:out value="${custVo.phone}"></c:out></p>
							</div>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">FAX</label>
						
						<div class="col-sm-11">
							<c:out value="${custVo.fax}"></c:out>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">사업장 주소</label>
						
						<div class="col-sm-11">
							<p><c:out value="${custVo.address}"></c:out></p>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label2">고객사 정보</label>
						
						<div class="col-sm-11">
							<p><c:out value="${custVo.custInfo}"></c:out></p>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="row">
						<div class="col-md-12 align-center">
						<c:if test="${user.userId eq custVo.userId}">
							<button type="button" class="btn btn-turquoise" id="btnMod">수정</button>
							<button type="button" class="btn btn-turquoise" id="btnDel">삭제</button>
						</c:if>
							<button type="button" class="btn btn-gray" id="btnCancel">목록</button>
						</div>
					</div>
					
				</c:otherwise>
			</c:choose>	
				
				</form>
			</div>
		</div>
	
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">업무 기록</h3>
		
		<div class="panel-options">
			<div class="btn-group">
				<button class="btn btn-white btn-sm" id="btnCreRecord">추가</button>
			</div>
		</div>
	</div>
	
	<div class="panel-body">
		<table id="recordList" class="table table-small-font table-striped table-hover" cellspacing="0" width="100%">	</table>
	</div>
</div>
	
	<script>
	
		$(document).ready(function() {
			$('#btnSave').on('click', function() {
				if ('${custSeq}' == '')
					$('form').prop('action', './setCustomer').submit();
				else
					$('form').prop('action', './modCustomer').submit();
			});
			
			$('#btnMod').on('click', function() {
				window.location.href = "./customerEdit?custSeq=${custSeq}&modState=Y"; 
			});
			
			$('#btnDel').on('click', function() {
				if (confirm("삭제 하시겠습니까?")) {
					$('form').prop('action', './delCustomer').submit();
				}
			});
			
			$("#btnCancel").on('click', function(e) {
				$(location).prop('href', 'javascript:history.go(-1)');
			});
			
			$('#btnList').on('click', function() {
				window.location.href = "./customerMain";
			});
			
			$('#btnCreRecord').on('click', function() {
				$.get('./modal/recordModal', function(data) {
					modalToggle(true, data, "업무기록 추가");
				});
			});
			
			
		}); //ready End
		
	</script>