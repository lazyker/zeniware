<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form role="form" id="frmRecord">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title"></h4>
	</div>

	<div class="modal-body">

		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">작성일</label>
					<input type="text" class="form-control datepicker" name="recYmd" id="recYmd" data-format="yyyy-mm-dd" />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">업무내용</label>
					<textarea class="form-control" rows="4" name="recCont"></textarea>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">파일첨부</label>
					<input type="file" class="form-control" name="file" />
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="modal-footer">
<%-- 		<c:if test="${comp.compId.length() > 0}"> --%>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${comp.useYn}"> --%>
<!-- 					<div class="form-group pull-left">			 -->
<!-- 						<button type="button" class="btn btn-danger" id="btnSoftDelete">회사삭제</button> -->
<!-- 						<button type="button" class="btn btn-gray" id="btnUnit">부서/사용자</button> -->
<!-- 						<button type="button" class="btn btn-gray" id="btnDelDept">삭제부서</button> -->
<!-- 						<button type="button" class="btn btn-gray" id="btnDelUser">삭제계정</button> -->
<!-- 					</div> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<div class="form-group pull-left"> -->
<!-- 						<button type="button" class="btn btn-danger" id="btnHardDelete">삭제</button> -->
<!-- 						<button type="button" class="btn btn-gray" id="btnRestore">복원</button> -->
<!-- 					</div> -->
<%-- 				</c:otherwise>				 --%>
<%-- 			</c:choose>	 --%>
<%-- 		</c:if> --%>
		
		<div class="form-group">
			<button type="submit" class="btn btn-info">확인</button>
			<button type="reset" class="btn btn-white" data-dismiss="modal">취소</button>
		</div>
	</div>

</form>

<script type="text/javascript">
	
// 	var curCompId = "${comp.compId}";
// 	var contextPath = "${pageContext.request.contextPath}";

	jQuery(document).ready(function($) {
		
// 		$('#recYmd').datepicker(jQuery.isEmptyObject(userJoinDate) ? '' : 'update', userJoinDate);
		
// 		/* 회사 삭제(Soft Delete) */
// 		$('#btnSoftDelete').on('click', function() {
// 			deleteComp('soft');
// 		});
		
// 		/* 부서/사용자 관리 */
// 		$('#btnUnit').on('click', function() {
// 			$(location).prop('href', contextPath + '/admin/preference/unitMain?compId=' + curCompId);
// 		});
		
// 		/* 삭제부서 관리 */
// 		$('#btnDelDept').on('click', function() {
// 			$(location).prop('href', contextPath + '/admin/preference/unitDeletedDept?compId=' + curCompId);
// 		});
		
// 		/* 삭제계정 관리 */
// 		$('#btnDelUser').on('click', function() {
// 			$(location).prop('href', contextPath + '/admin/preference/unitDeletedUser?compId=' + curCompId);
// 		});
		
// 		/* 회사 삭제(Hard Delete) */
// 		$('#btnHardDelete').on('click', function() {
// 			deleteComp('hard');
// 		});
		
// 		/* 회사 복원 */
// 		$('#btnRestore').on('click', function() {
// 			bootbox.confirm("복원하시겠습니까?", function(result) {
// 				if (result) {
// 					$.ajax({
// 						dataType: "json", 
// 						type: "post", 
// 						url: contextPath + "/admin/ajax/restoreSingleComp", 
// 						data: { compId: curCompId }, 
// 						success: function(data) {
// 							toastrAlert('success', '복원되었습니다.');
// 							modalToggle(false);
							
// 							$('#tblComp').DataTable().ajax.reload(null, false);
// 						} 
// 					});
// 				}
// 			});
// 		});
		
		/* 저장 */
		$('#frmRecord').validate({
			rules: {
				recYmd: { required: true, maxlength: 50 }, 
				recCont: { maxlength: 250 }
			}, 
			submitHandler: function(form) {
	 			$.ajax({
					dataType: "json", 
					type: "post", 
					url: "${pageContext.request.contextPath}/admin/ajax/setSingleComp", 
					data: {
						comp: createNameElements()
					}, 
					success: function(data) {
						toastrAlert('success', '저장되었습니다.');
						modalToggle(false);
						
						$('#tblComp').DataTable().ajax.reload(null, false);
					} 
				});
			}
		});
		
// 		function deleteComp(delMode) {
// 			bootbox.confirm("삭제하시겠습니까?", function(result) {
// 				if (result) {
// 					$.ajax({
// 						dataType: "json", 
// 						type: "post", 
// 						url: contextPath + "/admin/ajax/deleteSingleComp", 
// 						data: { mode: delMode, compId: curCompId }, 
// 						success: function(data) {
// 							toastrAlert('success', '삭제되었습니다.');
// 							modalToggle(false);
							
// 							$('#tblComp').DataTable().ajax.reload(null, false);
// 						} 
// 					});
// 				}
// 			});
// 		}

		// Datepicker
		if($.isFunction($.fn.datepicker))
		{
			$(".datepicker").each(function(i, el)
			{
				var $this = $(el),
					opts = {
						format: attrDefault($this, 'format', 'yyyy-mm-dd'),
						startDate: attrDefault($this, 'startDate', ''),
						endDate: attrDefault($this, 'endDate', ''),
						daysOfWeekDisabled: attrDefault($this, 'disabledDays', ''),
						startView: attrDefault($this, 'startView', 0),
						language: "kr",
						autoclose: true,
						rtl: rtl()
					},
					$n = $this.next(),
					$p = $this.prev();

				$this.datepicker(opts);

			});
		}

	});
	
</script>

<style type="text/css"> 

/* 	.modal .modal-dialog { */
/* 		width: 50%; */
/* 	} */
	
/* 	.modal .modal-body .panel { */
/* 		height: 400px; */
/* 		overflow-y: auto; */
/* 	} */
	
	.datepicker {
		z-index: 100000 !important;
	}

</style>