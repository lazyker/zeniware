<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<sec:authentication var="user" property="principal" />

<div class="sidebar-menu toggle-others" style="background-color:#E3E3E3;">

	<div class="sidebar-menu-inner">
	
			<div class="panel-body">
			
				<div class="form-group logo-expanded">
					<div class="col-sm-12">
						<div class="btn-group" style="width:100%">
							<a class="btn btn-primary btn-lg" id="scheduleWrite" style="width:100%">일정 등록</a>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="datepicker no-border" id="datepickerCal"></div>
					</div>
				</div>
				
			</div>
					
	</div>

	<div class="calendar-env"></div>
	
	<div class="text-right" style="margin-right:15px">
		<a href="#" data-toggle="modal" data-target="#calendarModal" data-whatever="new" style="margin-right:3px">
			<i class="fa fa-plus"></i>
		</a>
		
		<a href="javascript:;" id="showDelCalBtn">
			<i class="fa fa-minus"></i>
		</a>
	</div>
	
	<%
	
// 	ArrayList<Map<String,Object>> list = (ArrayList<Map<String,Object>>)request.getAttribute("arrData");
// 	System.out.println("list :::::::::::: " + list);
	
// 	for(Map<String, Object> map : list) {
// 		for (Map.Entry<String, Object> entry : map.entrySet()) {
// 	        String key = entry.getKey();
// 	        Object value = entry.getValue();
	        
// 	        System.out.println("key ---------- " + key);
// 	        System.out.println("value ---------- " + value);
// 	    }
// 	}
	
	%>
	
<%-- <c:forEach items="<c:out value='${arrData}'/>" var="list" varStatus="status"> --%>
<%-- 	<c:forEach items="<c:out value='${list}'/>" var="map">  --%>
<%-- 		<c:out value="${map}" /> <br/> --%>
<%-- 	</c:forEach> --%>
<%-- </c:forEach> --%>

<%-- <c:forEach items="${arrData}" var="map"> --%>
<%-- ${map.name} --%>
<%--     <c:forEach items="${map}" var="entry"> --%>
<%--         ${entry}<br> --%>
<%--     </c:forEach> --%>
<%-- </c:forEach> --%>


	<ul id="calendar-menu" class="calendar-menu">
	
		<c:forEach items="${calList}"  var="detail"  varStatus="status">
		<li  id="<c:out value="${detail.cldrId}"/>">
			<input type="checkbox" class="cbr cbr-<c:out value="${detail.cldrColorVal}"/>" checked> 
			<a href="#" class="calendarList" data-toggle="modal" data-target="#calendarModal" data-whatever="<c:out value="${detail.cldrId},${detail.cldrNm},${detail.cldrColorVal}" />" >
				<c:out value="${detail.cldrNm}" />
			</a>
		</li>
		</c:forEach>
		
<!-- 		<li> -->
<!-- 			<label id="label_1"> -->
<!-- 				<div class="cbr-replaced cbr-checked cbr-secondary"> -->
<!-- 					<div class="cbr-input"><input type="checkbox" class="cbr cbr-done" checked></div> -->
<!-- 					<div class="cbr-state"><span></span></div> -->
<!-- 				</div> 내 캘린더     -->
<!-- 			</label> -->
<!-- 		</li> -->
		
	</ul>
	
	<div class="calendar-env"></div>
	
	<div style="margin-bottom: 10px;">
		<div style="margin-left:17px;float:left;">할 일</div>
		<div class="text-right" style="margin-right:15px;">
			<a href="#" style="margin-right:3px;">
				<i class="fa fa-plus"></i>
			</a>
			
			<a href="#">
				<i class="fa fa-minus"></i>
			</a>
		</div>
	</div>
	
	<ul id="todo-menu" class="calendar-menu">
	
		<li>
			<label>
				<a href=""><input type="checkbox" class="cbr cbr-info"> 개인 스케줄</a>
			</label>
		</li>
		<li>
			<label>
				<input type="checkbox" class="cbr cbr-danger"> 회사 스케줄
			</label>
		</li>
		
	</ul>
					
</div>
	
	<!-- 캘린더 추가 Modal -->
	<form role="form" id="calForm" class="validate">
	<div class="modal fade" id="calendarModal">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">내 캘린더 추가</h4>
				</div>
				
				<div class="modal-body">
				
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-1" class="control-label">캘린더 이름</label>
								
								<input type="text" class="form-control" id="cldrNm" name="cldrNm" data-validate="required" />
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-1" class="control-label">캘린더 색상</label>
								
								<div class="input-group">
									<select name="colorpicker-option-selected" id="cldrColorVal">
										<option value="#68b828">Secondary</option>
										<option value="#d5080f">Red</option>
										<option value="#00b19d">Turquoise</option>
										<option value="#0e62c7">Blue</option>
										<option value="#40bbea">Info</option>
										<option value="#f7aa47">Orange</option>
										<option value="#7c38bc">Purple</option>
										<option value="#c8c8c8">Gray</option>
										<option value="#ff6264">Pink</option>
									</select>
								</div>
							</div>	
							
						</div>
					</div>
				
				</div>
					<div id="chkVal" style="display:none;border-color: #cc3f44;color: #cc3f44">※ 값이 모두 입력되지 않았습니다.</div>
					<input type="hidden" name="cldrId" id="hidnCalId" />
	
				<div class="modal-footer form-group">
					<button type="button" class="btn btn-info" id="saveCal">저장</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	</form>
	
		<script type="text/javascript">
		
		$(document).ready(function() {
			
			$.ajax({
				url: './getCalendarList',
				data : {
					userId : '<c:out value="${user.userId}"/>',
					compId : '<c:out value="${user.compId}"/>'
					
				},
				success : function(data){
					
					var strCal = $('#calendar-menu');
					var obj = JSON.parse(data);
					
					$.each(obj, function(i) {
						strCal.append(
								'<li  id="' + obj[i].cldrId + '">'
								+ '<input type="checkbox" class="cbr cbr-'+ obj[i].cldrColorVal +'" checked>'
								+ '<a href="#" class="calendarList" data-toggle="modal" data-target="#calendarModal" data-whatever="'+ obj[i].cldrId +',' + obj[i].cldrNm +',' + obj[i].cldrColorVal +'">&nbsp'
								+ obj[i].cldrNm
								+ '</a></li>'
								);
					});
					
					cbr_replace();
					
// 					<li  id="<c:out value="${detail.cldrId}"/>">
// 					<input type="checkbox" class="cbr cbr-<c:out value="${detail.cldrColorVal}"/>" checked> 
// 					<a href="#" class="calendarList" data-toggle="modal" data-target="#calendarModal" data-whatever="<c:out value="${detail.cldrId},${detail.cldrNm},${detail.cldrColorVal}" />" >
// 						<c:out value="${detail.cldrNm}" />
// 					</a>
// 				</li>					
					
				}
					
			})
			
			//simplecolorpicker 적용
			$('select[name="colorpicker-option-selected"]').simplecolorpicker({theme: 'glyphicons'});
			
			//캘린더 Modal 활성화 전 이번트
			$('#calendarModal').on('show.bs.modal', function (event) {
				{
					//모달 초기화
					$('#hidnCalId').val("");
					$('#cldrNm').val("");
				}
				
			    var button = $(event.relatedTarget) //이것이 Modal을 화면에 보이도록 한 버튼이다.
				var data = button.data('whatever');			                                       
			    var modal = $(this); //Modal 전체를 담고있는 DIV 객체가 그대로 전달되므로,Modal 안쪽의 오브젝트에 접근하기 위해서 사용한다.
			    
			    if( data !== "new") {
			    	var data = data.split(',');
			    	
					modal.find('.modal-title').text('캘린더 수정');
					modal.find('#hidnCalId').val(data[0]); //캘린더 아이디
					modal.find('#cldrNm').val(data[1]); //이름
					
					var colorData = rgbChange(data[2]); //색상값 구하기
					modal.find('#cldrColorVal').val(colorData);
					var spanColor = modal.find('.color');
					
					$.each(spanColor, function() {
						//Modal은 hide 형태 이기 때문에 체크된 캘린더 색상을 모두 해제 후 다시 색상을 bind 한다.
						if( $(this).attr('data-selected') == ""  || $(this).attr('data-selected') == "true") { //selected 해제
							$(this).removeAttr('data-selected');
						} 
						
						if( $(this).attr('data-color') == colorData ) {
							$(this).attr('data-selected', true);
						}
					});
			    }
			    else { //신규
			    	modal.find('.modal-title').text('캘린더 추가');
			    }
			    
			});
			
// 			$('#calendarModal').on('hidden.bs.modal', function () {
// 				//모달 초기화
// 				$('#cldrNm').val("");
// 				$(this).removeData('bs.modal');
// 				});
			
			//캘린더 삭제 버튼 보이기
			$('#showDelCalBtn').on('click', function() {
				showDelCalBtn();
			});
			
			$('#saveCal').on('click', function() {
				var $cldrNmVal = $('#cldrNm');
				
				if ($cldrNmVal.val() == "") {
					$('#chkVal').show();
					setTimeout(function() {
						$('#chkVal').hide();
					}, 1000);
					 return false;
				}

				addCalendar();
			});
			
		});
		
// 			function showAddCalModal()
// 			{ 
// 				//모달 초기화
// 				$('#cldrNm').val("");
// 				$('#calendarModal').modal('show', {backdrop: 'static'});
// 			}
			
			function addCalendar() 
			{
				var color; $('#cldrColorVal').val()==null ? color = "#68b828" : color = $('#cldrColorVal').val(); 
				var colorClass = colorChange(color); //컬러값 class 이름으로 변경
				var cldrId = $('#hidnCalId').val();
				var data = {
						cldrNm : $('#cldrNm').val(),
						cldrColorVal : colorClass
				};
				
				//수정할 때..
				if( cldrId !== "" ) { 
					data.cldrId = 	cldrId;
				}
				
				$.ajax({
					url: './addCalendar',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					data: data,
					success: function(data)
					{
						var obj = JSON.parse(data);
						
						//수정일 경우 태그 지우기
						if( obj.runType == "New" ) {
							var calendarListStr = 
								"<li id=\"" + obj.cldrId + "\">" +
								"<a href='#' data-toggle='modal' data-target='#calendarModal' data-whatever='" + obj.cldrId + "," + obj.cldrNm + "," +obj.cldrColorVal + "'>" +
								"<input type='checkbox' class='cbr cbr-" + obj.cldrColorVal + "' checked> " + obj.cldrNm + 
								"</a>" + 
								"</li>";
								
							$('#calendar-menu').append(calendarListStr);
							//체크박스 설정(xenon cbr_replace 함수 커스터마이징)	
//	 						calCbrReplace(obj.cldrColorVal);
							
							
						}
						else {
							var cldrId = '#'+obj.cldrId; 
							$(cldrId).empty();
							
							var calendarListStr = 
							
								"<a href='#' data-toggle='modal' data-target='#calendarModal' data-whatever='" + obj.cldrId + "," + obj.cldrNm + "," +obj.cldrColorVal + "'>" +
								"<input type='checkbox' class='cbr cbr-" + obj.cldrColorVal + "' checked> " + obj.cldrNm + 
								"</a>";
								
							$(cldrId).append(calendarListStr);
						}
						
						cbr_replace(); //부트스트랩 체크박스 변환
						
					}
				});
				
				$('#cldrNm').val("");
				$('#cldrColorVal').val("");
				$('#calendarModal').modal('hide');
		}
			
			//Rgb값을 해당 클래스명으로 변환
			var colorChange = function(rgb) {
				var result;
				
				switch(rgb)  {
					case "#68b828" : result = "secondary"; break;
					case "#d5080f" : result = "red"; break;
					case "#00b19d" : result = "turquoise"; break;
					case "#0e62c7" : result = "blue"; break;
					case "#40bbea" : result = "info"; break;
					case "#f7aa47" : result = "orange"; break;
					case "#7c38bc" : result = "purple"; break;
					case "#c8c8c8" : result = "gray"; break;
					case "#ff6264" : result = "pink"; break;
				}
				
				return result;
			}
			
			//클래스명을 해당 Rgb값으로 변환
			var rgbChange = function(classNm) {
				var result;
				
				switch(classNm)  {
					case "secondary" : result = "#68b828"; break;
					case "red" : result = "#d5080f"; break;
					case "turquoise" : result = "#00b19d"; break;
					case "blue" : result = "#0e62c7"; break;
					case "info" : result = "#40bbea"; break;
					case "orange" : result = "#f7aa47"; break;
					case "purple" : result = "#7c38bc"; break;
					case "gray" : result = "#c8c8c8"; break;
					case "pink" : result = "#ff6264"; break;
				}
				
				return result;
			}
			
			//캘린더 삭제 버튼 활성화 이벤트
			function showDelCalBtn() {
		 		if($('.del').length <= 0) {
		 			$.each($('#calendar-menu > li'), function(idx, element) {
		 				var cldrId = $(element).attr('id');
		 				
		 				if( idx > 1 ) {
				 			var delHtml = 
				 				"<span class=\"pull-right del\">" +
				 				"<a href=\"javascript:;\" onclick=\"delCalendar(" + idx + ", \'" + cldrId + "\');\">" +
				 				"<i class=\"fa fa-times\"></i></a>" +
				 				"</span>";
			 				
				 			$('#' + cldrId).append(delHtml);
		 				}
			 			
		 			});
		 		}
		 		else{
			 		$('.del').remove();
		 		}
		 		
		 		
// 		 		$('#calendar-menu > li').each(function(index) {
// 		 			var del = 
// 		 				'<span class="pull-right">' +
// 						'<a href=""><i class="fa fa-times"></i></a>' +
// 						'</span>';
						
// 		 			$(this).append(del);
// 		 			$(this).find('.cbr-state').append('<div>11</div>');
					//$(this).find('.cbr-state').css('background', '#cc3f11');
// 				});

			}
			
			//캘린더 삭제
			function delCalendar(index, cldrId) {
					$.ajax({
						url: '${pageContext.request.contextPath}/schedule/delCalendar',
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						data: {
							cldrId : cldrId
						},
						success: function(data)
						{
							$('#' + cldrId).remove();
							
							var opts = {
									"closeButton": true,
									"positionClass": "toast-bottom-right",
								};
								
								toastr.success("삭제 처리 되었습니다.", null, opts);
						}
					});
			}		
			
			
			function calCbrReplace(rgb)
			{
				var $inputs = jQuery('input[type="checkbox"].cbr, input[type="radio"].cbr').filter(':not(.cbr-done)'),
					$wrapper = '<div class="cbr-replaced"><div class="cbr-input"></div><div class="cbr-state"><span></span></div></div>';

				$inputs.each(function(i, el)
				{
					var $el = jQuery(el),
						is_radio = $el.is(':radio'),
						is_checkbox = $el.is(':checkbox'),
						is_disabled = $el.is(':disabled');
						styles = ['primary', 'secondary', 'success', 'danger', 'warning', 'info', 'purple', 'blue', 'red', 'gray', 'pink', 'yellow', 'orange', 'turquoise'];

					if( ! is_radio && ! is_checkbox)
						return;

					$el.after( $wrapper );
					$el.addClass('cbr-done');

					var $wrp = $el.next();
					$wrp.find('.cbr-input').append( $el );

					if(is_radio)
						$wrp.addClass('cbr-radio');

					if(is_disabled)
						$wrp.addClass('cbr-disabled');

					if($el.is(':checked'))
					{
						$wrp.addClass('cbr-checked');
					}

					// Style apply
					jQuery.each(styles, function(key, val)
					{
						var cbr_class = 'cbr-' + val;

						if( $el.hasClass(cbr_class))
						{
							$wrp.addClass(cbr_class);
							$el.removeClass(cbr_class);
						}
					});
					
					//lazyker 추가
					$wrp.find('.cbr-state').css('background', rgb).css('border-color', rgb);

					// Events
					$wrp.on('click', function(ev)
					{
						if(is_radio && $el.prop('checked') || $wrp.parent().is('label'))
							return;

						if(jQuery(ev.target).is($el) == false)
						{
							$el.prop('checked', ! $el.is(':checked'));
							$el.trigger('change');
						}
					});

					$el.on('change', function(ev)
					{
						$wrp.removeClass('cbr-checked');

						if($el.is(':checked'))
							$wrp.addClass('cbr-checked');

						cbr_recheck();
					});
				});
			}
			
			
		</script>