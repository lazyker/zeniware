<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="currentUser" property="principal" />

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">전자결재 양식관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="../../admin/preference/codeMain"><i class="fa-home"></i>Home</a></li>
			<li><a href="../workflow/basicInit">전자결재</a></li>
			<li class="active">양식관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">

	<div class="col-md-12">
	
		<div class="btn-group pull-right">
			<button class="btn btn-white btn-sm" id="btnFormAdd">양식추가</button>
			<button class="btn btn-white btn-sm" id="btnContAdd">양식함추가</button>
			<button class="btn btn-white btn-sm" id="btnContDel">양식함삭제</button>
			<button class="btn btn-white btn-sm" id="btnContEdit">양식함변경</button>
		</div>
		
	</div>
	
</div>

<div class="row">

	<div class="col-md-12">

		<div class="panel-group" id="accordion-test-2">
		
			<c:forEach var="formCont" items="${formContList}">
				<div class="panel panel-default panel-border panel-shadow">
				
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion-test-2" href="#${formCont.contId}" class="collapsed">
								<span>${formCont.contName}</span>
								<b class="hide">&times;</b>
							</a>
						</h4>
					</div>
				
					<div id="${formCont.contId}" class="panel-collapse collapse">
					
						<div class="list-group list-group-minimal">
							<c:forEach var="curForm" items="${formCont.formList}">
								<a href="./formNew" id="${curForm.formId}" class="list-group-item">
									<c:choose>
										<c:when test="${curForm.storagePeriod == 0}"><span class="badge badge-info">수시폐기</span></c:when>
										<c:when test="${curForm.storagePeriod == 1}"><span class="badge badge-success">1년</span></c:when>
										<c:when test="${curForm.storagePeriod == 3}"><span class="badge badge-blue">3년</span></c:when>
										<c:when test="${curForm.storagePeriod == 5}"><span class="badge badge-warning">5년</span></c:when>
										<c:when test="${curForm.storagePeriod == 10}"><span class="badge badge-purple">10년</span></c:when>
										<c:otherwise><span class="badge badge-danger">영구보존</span></c:otherwise>
									</c:choose>
									<span>${curForm.formName}</span>
								</a>
							</c:forEach>
							
						</div>
					
					</div>
					
				</div>
			</c:forEach>
			
		</div>
		
	</div>
	
</div>

<script type="text/javascript">

	var contEditable = false;
	
	$(document).ready(function() {	
		
		$('#btnFormAdd').on('click', function() {
			$(location).prop('href', './formNew');
		});
		
		$('#btnContAdd').on('click', function() {
			$.get('./modal/formContNew', function(data) {
				modalToggle(true, data);
			});
		});
		
		$('#btnContDel').on('click', function() {
			if (contEditable) {
				$('.panel-group .panel .panel-heading a b').addClass('hide');
				$('.panel-group .panel .panel-heading a').attr('data-toggle', 'collapse');
				
				buttonToggle($(this));
				contEditable = false;
			} else {
				$('.panel-group .panel .panel-heading a b').removeClass('hide');
				$('.panel-group .panel .panel-heading a').removeAttr('data-toggle');
				
				buttonToggle($(this));
				contEditable = true;
			}
		});
		
		/* 전자결재 양식함 변경 */
		$('#btnContEdit').on('click', function() {
			if (contEditable) {
				bootbox.dialog({
					message: "저장하시겠습니까?", 
					title: "확인", 
					buttons: {
						success: {
							label: "저장", 
							className: "btn-info", 
							callback: function() {
								$.ajax({
									dataType: 'json', 
									type: 'post', 
									url: './ajax/updateFormContList', 
									data: { contlist: createJsonObject() },  
									success: function(data) {
										toastrAlert('success', '저장되었습니다.');
										
										$('.panel-group').sortable({ disabled: true });
				 						$('.panel-group .list-group').sortable({ disabled: true });
				 						$('.panel-group .panel .panel-heading a span').editable('destroy');
				 						
				 						$('.panel-group .panel .panel-heading a span').replaceWith(function() {
				 							return $('<' + this.nodeName + '>').append($(this).contents()).append('</' + this.nodeName + '>');
				 						});
										
				 						buttonToggle($(this));
				 						contEditable = false;
									}
								});
							}
						}, 
						cancel: {
							label: "취소", 
							className: "btn-gray", 
							callback: function() {
								$(location).prop('href', './formMaker');
							}
						}, 
						close: {
							label: "닫기", 
							className: "btn-white", 
							callback: function() {
								return;
							}
						}
					}
				});
			} else {
				$('.panel-group').sortable({ disabled: false });
				$('.panel-group .list-group').sortable({
					disabled: false, 
					connectWith: [ '.panel-group .list-group' ], 
					dropOnEmpty: true
				});
				
				$('.panel-group .panel .panel-heading a span').editable({ mode: 'inline' }).on('shown', function() {
					$(this).parent().removeAttr('data-toggle');
				}).on('hidden', function() {
					$(this).parent().attr('data-toggle', 'collapse');
				});
				
				buttonToggle($(this));
				contEditable = true;
			}
		});
		
		$('.panel-group .panel .panel-heading a b').on('click', function() {
			bootbox.confirm('삭제하시겠습니까?', function(result) {
				console.log(result);
			});
		});
	
	});
	
	/* 편집 모드 시 링크 비활성화 */
	$('.panel-group .list-group').on('click', 'a', function(event) {
		event.preventDefault();
		
		if (contEditable) {
			return false;
		} else {
			$(location).prop('href', $(this).prop('href'));
		}
	});
	
	function buttonToggle(curButton) {
		$('button', '.btn-group').each(function(index) {
			if (contEditable) {
				$(this).removeClass('disabled').removeClass('btn-info').addClass('btn-white');
			} else {
				$('button', '.btn-group').each(function(index) {
					if ($(this).prop('id') == curButton.prop('id')) {
						$(this).removeClass('btn-white').addClass('btn-info');
					} else {
						$(this).addClass('disabled');
					}
				});
			}
		});
	}
	
	function createJsonObject() {
		var curCompId = "${currentUser.compId}";
		var jsonObj = [];
		
		$('.panel-group .panel').each(function(index) {
			var jsonItem = {};
			
			jsonItem['compId'] = curCompId;
			jsonItem['contId'] = $('.panel-collapse', $(this)).prop('id');
			jsonItem['contName'] = $('.panel-heading a span', $(this)).text();
			jsonItem['sortOrder'] = index;
			
			var jsonChildObj = [];
			
			$('.panel-collapse a', $(this)).each(function(childIndex) {
				var jsonChildItem = {};
				
				jsonChildItem['formId'] = $(this).prop('id');
				jsonChildItem['sortOrder'] = childIndex;

				jsonChildObj.push(jsonChildItem);
			});
			
			jsonItem['formList'] = jsonChildObj;
			
			jsonObj.push(jsonItem);
		});
		
		return JSON.stringify(jsonObj);
	};
	
/* ***References***

*/

</script>
