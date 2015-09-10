<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="currentUser" property="principal" />

<form role="form" id="frmCont">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">전자결재 양식함 추가</h4>
	</div>

	<div class="modal-body">
		<div class="form-group">
			<input type="text" class="form-control" name="contName" />
			<input type="hidden" name="compId" value="${currentUser.compId}" />
		</div>
	</div>
	
	<div class="modal-footer">
		<div class="form-group">
			<button type="submit" class="btn btn-info">확인</button>
			<button type="reset" class="btn btn-white" data-dismiss="modal">취소</button>
		</div>
	</div>

</form>

<script type="text/javascript">
	
	jQuery(document).ready(function($) {
		
		/* 회사 정보 저장 */
		$('#frmCont').validate({
			rules: {
				contName: { required: true, maxlength: 100 }
			}, 
			submitHandler: function(form) {
	 			$.ajax({
					dataType: 'json', 
					type: 'post', 
					url: './ajax/insertSingleFormCont', 
					data: {
						cont: createNameElements()
					}, 
					success: function(data) {
						toastrAlert('success', '저장되었습니다.');
						$(location).prop('href', './formMaker');
					} 
				});
			}
		});

	});
	
/* ***References***

*/

</script>
