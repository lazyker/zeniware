<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="frm" role="form" method="post">

	<div class="panel panel-default">
	
		<div class="panel-heading">
			<h3 class="panel-title">전자결재 양식 추가</h3>
		</div>
	
		<div class="panel-body">
		
			<div class="form-group">
				<textarea class="form-control ckeditor" rows="10"></textarea>
			</div>
				
			<div class="row">
			
				<div class="pull-right">
					<button type="button" class="btn btn-secondary" id="btnSave">저장</button>
					<button type="button" class="btn btn-gray" id="btnCancel">취소</button>
				</div>
			
			</div>
				
		</div>
			
	</div>

</form>

<script type="text/javascript">

	$(document).ready(function() {
		
		$('#btnCancel').on('click', function() {
			$(location).prop('href', './formMaker');
		});
		
	});

/* ***References***

*/

</script>