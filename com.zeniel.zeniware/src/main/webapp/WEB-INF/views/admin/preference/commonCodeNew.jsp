<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="panel panel-default">

	<div class="panel-heading">
		<h3 class="panel-title">공통 코드 등록</h3>
	</div>
	
	<div class="panel-body">
		
		<form role="form" class="form-horizontal" id="frm" action="commonCodeNew" method="post">
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="groupId">그룹ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="groupId" placeholder="GroupID">
				</div>
			</div>
			
			<div class="form-group-separator"></div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="codeId">코드ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="codeId" placeholder="CodeID">
				</div>
			</div>
			
			<div class="form-group-separator"></div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="codeNameKo">코드명</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="codeNameKo" placeholder="CodeName - Korean">
					<br />
					<input type="text" class="form-control" id="codeNameEn" placeholder="CodeName - English">
					<br />
					<input type="text" class="form-control" id="codeNameCn" placeholder="CodeName - Chinese">
					<br />
					<input type="text" class="form-control" id="codeNameJp" placeholder="CodeName - Japanese">
				</div>
			</div>
						
			<div class="form-group-separator"></div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="sortOrder">정렬순서</label>
				<div class="col-sm-10">
					<div class="input-group spinner" data-step="1" data-min="0" data-max="999">
						<span class="input-group-btn">
							<button class="btn btn-gray" data-type="decrement">-</button>
						</span>
						<input type="text" class="form-control text-center" value="0" id="sortOrder" />
						<span class="input-group-btn">
							<button class="btn btn-gray" data-type="increment">+</button>
						</span>
					</div>
				</div>
			</div>
			
			<div class="form-group-separator"></div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="useYn">사용여부</label>
				<div class="col-sm-10"><input type="checkbox" checked class="iswitch iswitch-secondary" id="useYn"></div>
			</div>
			
			<div class="form-group-separator"></div>
						
			<div class="form-group">
				<label class="col-sm-2 control-label" for="description">상세설명</label>
				<div class="col-sm-10"><textarea class="form-control" cols="2" id="description"></textarea></div>
			</div>
			
			<div class="form-group-separator"></div>
			
			<div class="form-group text-right">
				<button class="btn btn-white" id="btnClose">Close</button>
				<button class="btn btn-primary" id="btnSave">Save changes</button>
			</div>
			
		</form>
		
	</div>

</div>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#btnClose").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/preference/commonCodeMain');
			return false;
		});
		
		$("#btnSave").click(function() {
			$("#frm").submit();
		});
		
	});
	
</script>