<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
	<div class="title-env">
		<h1 class="title">커뮤니티 기본설정</h1>
		<p class="description">Dynamic table variants with pagination and other controls</p>
	</div>
	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="dashboard-1.html"><i class="fa-home"></i>Home</a></li>
			<li><a href="tables-basic.html">Community</a></li>
			<li class="active"><strong>Basic Setup</strong></li>
		</ol>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#editIcon").click(function() {
		repeatSizeEvent($(this));
	});
});

function repeatSizeEvent(ev) {
	//$('#editIcon').hide();
	//$('#fileSizeGet').hide();
	//$('#sizeFiled').show();
	var $chcks = $("#test2 input[type='radio']");
	$chcks.prop('checked', true).trigger('change');
	$('#test1').hide();
	$('#test2').show();
}
</script>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">개설방식</label>
						<div class="col-sm-10">
							<div class="radio">
								<label>
									<input type="radio" name="radio-1" class="cbr cbr-blue">
									관리자 승인 후 개설 
								</label>
							</div>
							<div class="radio">
								<label>
									<input type="radio" name="radio-1" class="cbr cbr-danger" checked>
									관리자 승인없이 개설 
								</label>
							</div>
						</div>
					</div>
					<div class="form-group-separator"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">파일 용량제한<br/>(파일1개)</label>
						<div class="col-sm-10">
							<div class="radio">
								<label>
									<input type="radio" name="radio-2" class="cbr cbr-danger"> 제한없음 
								</label>
							</div>
							<div class="radio" id="test1">
								<label>
									<input type="radio" name="radio-2" class="cbr cbr-blue" checked> 용량제한
									&nbsp;&nbsp;
									<span class="title" id="fileSizeGet"><c:out value="${file_size}" /> <i id="editIcon" class="fa fa-file-text"></i>
									<%-- <div class="row">
										<div class="col-md-6">
											<div class="input-group spinner" data-step="1" data-min="0" data-max="100">
												<span class="input-group-btn">
													<button class="btn btn-gray" data-type="decrement">-</button>
												</span>
												<input type="text" class="form-control text-center" value="${file_size}" id="sortOrder" />
												<span class="input-group-btn">
													<button class="btn btn-gray" data-type="increment">+</button>
												</span>
											</div>
										</div>
									</div> --%>
									</span>
									<%-- <input type="text" class="form-control" name="file_size" value="<c:out value='${file_size}' />" id="sizeFiled" style="display:none;" /> --%>
									MB 이하
								</label>
							</div>
							<div class="radio" id="test2" style="display:none;">
								<input type="radio" name="radio-2" class="cbr cbr-blue"> 용량제한
								&nbsp;&nbsp;
								<input type="text" class="form-control" name="file_size" value="<c:out value='${file_size}' />" id="sizeFiled" />
								MB 이하
							</div>
						</div>
					</div>
					<div class="form-group-separator"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="field-1">파일 개수제한<br/>(게시물당)</label>
						<div class="col-sm-10">
							<div class="radio">
								<!-- <label>
									<input type="radio" name="radio-3" class="cbr cbr-danger"> 제한없음 
								</label> -->
								<input type="radio" name="radio-3" class="cbr cbr-danger"> 제한없음 
							</div>
							<div class="radio">
								
									<input type="radio" name="radio-3" class="cbr cbr-blue" checked> 개수제한
									&nbsp;&nbsp;
								<label>
									<span class="title"><c:out value="${cmutBasic.FILE_ADD_CNT}" /></span>
									<i class="fa fa-file-text"></i> 개 이하
								</label>
							</div>
						</div>
					</div>
					<div class="form-group-separator"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="field-1">업로드 불가 파일</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="field-1">
							※ 업로드를 제한할 파일의 확장자를 ,(쉼표)로 구분해서 등록해주세요. 
						</div>
					</div>
					<div class="form-group-separator"></div>
					<div class="form-group text-right">
						<button class="btn btn-primary" id="btnSave">Save changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>