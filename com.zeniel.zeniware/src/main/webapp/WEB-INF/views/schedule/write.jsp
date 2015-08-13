<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="col-sm-12">
	
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">일정 등록</h3>
			</div>
			
			<div class="panel-body">
				<form role="form" id="frm" class="form-horizontal" method="POST">
				<sec:authentication var="user" property="principal" />
				<input type="hidden" name="fstFrmigrId" value="${user.userId}"/>
				<input type="hidden" name="lstModrId" value="${user.userId}"/>
				<input type="hidden" name="schedId" id="schedId" value="${schedVo.schedId}"/>
				
					<div class="form-group">
						<label class="col-sm-1 control-label">제목</label>
						
						<div class="col-sm-9">
							<input type="text" class="form-control" name="schedNm" data-validate="required" value='<c:out value="${schedVo.title}"></c:out>' />
						</div>
						
<!-- 						<div class="col-sm-2"> -->
<!-- 							<div class="form-block"> -->
<!-- 								<label> -->
<!-- 									<input type="checkbox" class="cbr"> 비공개 -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label">장소</label>
						
						<div class="col-sm-11">
							<input type="text" class="form-control" name="apntPlc" value='<c:out value="${schedVo.apntPlc}"></c:out>'/>
						</div>
					</div>
				
					<div class="form-group">
						<label class="col-sm-1 control-label">일시</label>
						
						<div class="col-sm-5">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="linecons-calendar"></i>
								</div>
								<div class="date-and-time">
									<input type="text" class="form-control datepicker" name="startYmd" id="startYmd" data-format="yyyy-mm-dd" value='<c:out value="${startYmd}"></c:out>' />
									<input type="text" class="form-control timepicker" name="startTm" id="startTm" data-template="dropdown"  data-show-meridian="false" data-minute-step="30" value='<c:out value="${startTm}"></c:out>' />
								</div>
							</div>
						</div>
									
						<div class="col-sm-5">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="linecons-calendar"></i>
								</div>
								<div class="date-and-time">
									<input type="text" class="form-control datepicker" name="endYmd" id="endYmd" data-format="yyyy-mm-dd" value='<c:out value="${endYmd}"></c:out>' />
									<input type="text" class="form-control timepicker" name="endTm" id="endTm" data-template="dropdown" data-show-meridian="false" data-minute-step="30" value='<c:out value="${endTm}"></c:out>' />
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label">종일</label>
						
						<div class="col-sm-10">
							<div class="form-block">
								<label>
									<input type="checkbox" class="cbr" id="allDay">
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group-separator"></div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label">캘린더</label>
						
						<script type="text/javascript">
							jQuery(document).ready(function($)
							{
								$.ajax({
									url: './getCalendarList',
									data : {
										userId : '<c:out value="${user.userId}"/>',
										compId : '<c:out value="${user.compId}"/>'
										
									},
									success : function(data) {
										var calendarList = $('#calendarList');
										var obj = JSON.parse(data);
										
										$.each(obj, function(i) {
											var shreYn = obj[i].shreYn;
											
											calendarList.append(
													'<option value="'+ obj[i].cldrId +'">' + obj[i].cldrNm + '</option>'
													);
										});
										
										//selectboxit 모듈 활성화 전에 data bind
										$('#calendarList').val('<c:out value="${schedVo.cldrId}"></c:out>');
										
										$("#calendarList").selectBoxIt().on('open', function()
										{
											// Adding Custom Scrollbar
											$(this).data('selectBoxSelectBoxIt').list.perfectScrollbar();
										});
										
									}
								});
							});
						</script>
						
						<div class="col-sm-5">
							<select class="form-control" name="cldrId" id="calendarList" data-size="10">
<%-- 								<c:forEach items="${calList}" var="detail"> --%>
<!-- 									<option value=""></option> -->
<%-- 	 							</c:forEach> --%>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label" for="field-5">설명</label>

						<div class="col-sm-11">
							<textarea class="form-control" cols="5" id="field-5" name="memoCont"><c:out value="${schedVo.memoCont}"></c:out></textarea>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label">반복</label>
						
						<div class="col-sm-11">
							<div class="form-block">
								<label>
									<input type="checkbox" class="cbr" name="rpetYn" id="rpetYn" />
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group" id="rpetOption" style="display:none;">
						<label class="col-sm-1 control-label"></label>
						
						<div class="col-md-11">
							
							<ul class="nav nav-tabs">
								<li class="active" id="liDaily">
									<a href="#daily" data-toggle="tab">
										<span class="visible-xs">매일</span>
										<span class="hidden-xs">매일</span>
									</a>
								</li>
								<li id="liWeekly">
									<a href="#weekly" data-toggle="tab">
										<span class="visible-xs">매주</span>
										<span class="hidden-xs">매주</span>
									</a>
								</li>
								<li id="liMonthly">
									<a href="#monthly" data-toggle="tab">
										<span class="visible-xs">매월</span>
										<span class="hidden-xs">매월</span>
									</a>
								</li>
								<li id="liYearly">
									<a href="#yearly" data-toggle="tab">
										<span class="visible-xs">매년</span>
										<span class="hidden-xs">매년</span>
									</a>
								</li>
							</ul>
							
							<div class="tab-content" style="border:1px solid #ddd">
							
								<div class="tab-pane active" id="daily">
									<div class="form-group">
										<div class="col-md-2">
												<select class="form-control" id="dailyRpetCyc">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
												</select>
										</div>
										<div class="col-md-2">
											<p class="text-align7">일마다</p>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-2">
											<p class="text-align7">시작일로부터 : </p>
										</div>
										
										<div class="col-md-4">
											<div class="input-group">
												<input type="text" class="form-control datepicker" id="dailyEndYmd" data-format="yyyy-mm-dd">
												
												<div class="input-group-addon">
													<a href="#"><i class="linecons-calendar"></i></a>
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<p class="text-align7">까지 </p>
										</div>
										<div class="col-md-4">
											<div class="form-block">
												<label>
													<input type="checkbox" name="infinite"> 무한반복
												</label>
											</div>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="weekly">
									<div class="form-group">
										<div class="col-md-2">
												<select class="form-control" id="weeklyRpetCyc">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
												</select>
										</div>
										<div class="col-md-2">
											<p class="text-align7">주마다</p>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-10">
										<p>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr" name="rpetDd" value="0"> 일
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr" name="rpetDd" value="1"> 월
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr" name="rpetDd" value="2"> 화
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr" name="rpetDd" value="3"> 수
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr" name="rpetDd" value="4"> 목
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr" name="rpetDd" value="5"> 금
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr" name="rpetDd" value="6"> 토
											</label>
										</p>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-2">
											<p class="text-align7">시작일로부터 : </p>
										</div>
										
										<div class="col-md-4">
											<div class="input-group">
												<input type="text" class="form-control datepicker" id="weeklyEndYmd" data-format="yyyy-mm-dd">
												
												<div class="input-group-addon">
													<a href="#"><i class="linecons-calendar"></i></a>
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<p class="text-align7">까지 </p>
										</div>
										<div class="col-md-4">
											<div class="form-block">
												<label>
													<input type="checkbox" name="infinite" > 무한반복
												</label>
											</div>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="monthly">
									<div class="form-group">
										<div class="col-md-2">
												<select class="form-control" id="monthlyRpetCyc">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
												</select>
										</div>
										<div class="col-md-2">
											<p class="text-align7">개월마다</p>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-2">
											<p class="text-align7">시작일로부터 : </p>
										</div>
										
										<div class="col-md-4">
											<div class="input-group">
												<input type="text" class="form-control datepicker" id="monthlyEndYmd" data-format="yyyy-mm-dd">
												
												<div class="input-group-addon">
													<a href="#"><i class="linecons-calendar"></i></a>
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<p class="text-align7">까지 </p>
										</div>
										<div class="col-md-4">
											<div class="form-block">
												<label>
													<input type="checkbox" name="infinite" > 무한반복
												</label>
											</div>
										</div>
									</div>									
								</div>
								
								<div class="tab-pane" id="yearly">
									<div class="form-group">
										<div class="col-md-2">
												<select class="form-control" id="yearlyRpetCyc">
													<option value="1" selected>1</option>
												</select>
										</div>
										<div class="col-md-2">
											<p class="text-align7">년마다</p>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-2">
											<p class="text-align7">시작일로부터 : </p>
										</div>
										
										<div class="col-md-4">
											<div class="input-group">
												<input type="text" class="form-control datepicker" id="yearlyEndYmd"  data-format="yyyy-mm-dd">
												
												<div class="input-group-addon">
													<a href="#"><i class="linecons-calendar"></i></a>
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<p class="text-align7">까지 </p>
										</div>
										<div class="col-md-4">
											<div class="form-block">
												<label>
													<input type="checkbox" name="infinite" > 무한반복
												</label>
											</div>
										</div>
									</div>		
								</div>
							</div>
							
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12 align-center">
							<button type="button" class="btn btn-turquoise" id="saveSchedule">저장</button>
							<button type="button" class="btn btn-gray" id="cancel" >취소</button>
						</div>
					</div>
					
					<!-- 반복일정 data -->
					<input type="text" name="rpetCyc" id="rpetCyc" value='<c:out value="${schedVo.rpetCyc}"></c:out>' placeholder="반복주기">
					<input type="text" name="rpetEndYmd" id="rpetEndYmd" value='<c:out value="${schedVo.rpetEndYmd}"></c:out>' placeholder="반복종료일">
					<input type="text" name="rpetType" id="rpetType" value='<c:out value="${schedVo.rpetType}"></c:out>' placeholder="반복유형">
					<input type="text" name="unlmtRpetYn" id="unlmtRpetYn" value='<c:out value="${schedVo.unlmtRpetYn}"></c:out>' value="N" placeholder="무한반복">
					<input type="text" name="rpetDateType" id="rpetDateType" value='<c:out value="${schedVo.rpetDateType}"></c:out>' value="0" placeholder="반복날짜형태">
				</form>
			</div>
		</div>
	
	</div>
</div>

	<!-- Search Page -->
<!-- 			<section class="search-env" > -->
				
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
						
<!-- 						<form method="get" action="" enctype="application/x-www-form-urlencoded"> -->
<!-- 							<input type="text" class="form-control input-lg" placeholder="Search..." name="s"  /> -->
							
<!-- 							<button type="submit" class="btn-unstyled"> -->
<!-- 								<i class="linecons-search"></i> -->
<!-- 							</button> -->
<!-- 						</form> -->
						
						
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 			</section> -->
	
	<script>
	
		$(document).ready(function() {
			
			$('input[name="schedNm"]').focus();
			
			//수정일 경우..
			if ($('#schedId').val() != "") 
			{
				$('.panel-title').text('일정 수정');
				
				//종일 일정의 경우(startTm이 없는 경우) 수정 화면 설정
				if ('<c:out value="${startTm}"></c:out>' == "") {
					$('#startTm').val('12:00');
					$('#endTm').val('12:00');
					$('#allDay').prop('checked', true);
					$('#startTm').attr('disabled', true);
					$('#endTm').attr('disabled', true);
				}
				
				//반복일정의 경우 수정 화면 설정
				if ('<c:out value="${schedVo.rpetYn}"></c:out>' == 'Y') {
					var rpetType = $('#rpetType').val();
					var $tabs = $('.nav-tabs li');
					
					$('#rpetYn').prop('checked', true);
					$('#rpetOption').show();
					
					$('#liDaily').removeClass('active'); //기본탭 설정 제거
					
					
					if (rpetType == "D") {
						$('#liDaily').prop('class', 'active');					//탭
						$('#dailyEndYmd').val($('#rpetEndYmd').val());	//반복종료일
						$('#dailyRpetCyc').val($('#rpetCyc').val());		//반복주기
						
						
					} else if (rpetType == "W") {
						$('#liWeekly').prop('class', 'active');
						$('#weeklyEndYmd').val($('#rpetEndYmd').val());
						$('#weeklyRpetCyc').val($('#rpetCyc').val());
						
					} else if (rpetType == "M") {
						$('#liMonthly').prop('class', 'active');
						$('#monthlyEndYmd').val($('#rpetEndYmd').val());
						$('#monthlyRpetCyc').val($('#rpetCyc').val());
						
					} else if (rpetType == "Y") {
						$('#liYearly').prop('class', 'active');
						$('#yearlyEndYmd').val($('#rpetEndYmd').val());
						$('#yearlyRpetCyc').val($('#rpetCyc').val());
						
					}
					
					//무한반복일 경우
					if ($('#unlmtRpetYn').val() == 'Y') {
						$('input[name=infinite]').prop('checked', 'checked');
						$('#dailyEndYmd').attr('disabled', true);
						$('#weeklyEndYmd').attr('disabled', true);
						$('#monthlyEndYmd').attr('disabled', true);
						$('#yearlyEndYmd').attr('disabled', true);
					}
					
				}
				
			} //수정일 경우 End
									
			//종일 체크박스 클릭 이벤트
			$('#allDay').on('change', function() {
				allDayEvent($(this));
			});
			
			//반복 체크박스 클릭 이벤트
			$('#rpetYn').on('change', function() {
				repeatEvent($(this));
			});
			
			
			//무한반복 체크박스 이벤트 
			var $state = $('input[name=infinite]');
			$state.on('change', function(ev)
			{
				if($(this).is(':checked')) {
					$('#dailyEndYmd').attr('disabled', true);
					$('#weeklyEndYmd').attr('disabled', true);
					$('#monthlyEndYmd').attr('disabled', true);
					$('#yearlyEndYmd').attr('disabled', true);
					$state.prop('checked', true);  
				}
				else {
					$('#dailyEndYmd').attr('disabled', false);
					$('#weeklyEndYmd').attr('disabled', false);
					$('#monthlyEndYmd').attr('disabled', false);
					$('#yearlyEndYmd').attr('disabled', false);
					$state.prop('checked', false);
				}
			});
			
			//반복 옵션 탭 이벤트
			$('.nav-tabs').find('li').on('click', function() {
				var dayOption	= $(this).find('a').prop('href').split('#');
				
				rpetTitleEvent(dayOption[1]);
			});
			
			//저장 이벤트
			$('#saveSchedule').on('click', function() {

				if ( $("#calendarList option:selected").val() == undefined )
					$("#calendarList option:eq(0)").prop("selected", "selected");
				
				//시간이 한자리일 경우 앞에 0을 추가
				{
					var startTmVal = $('#startTm');
					var endTmVal = $('#endTm');
					
					if (startTmVal.val().length == 4)
						startTmVal.val(addZero(startTmVal.val()));
						
					if (endTmVal.val().length == 4)
						endTmVal.val(addZero(endTmVal.val()));
				}
							
				var $rpetCyc = $('#rpetCyc'); //반복주기
				var $rpetEndYmd = $('#rpetEndYmd'); //반복 종료일
				var repeatOps = repeatOption();
				$('#rpetDateType').val('0'); //default
				
				if (repeatOps == 'daily') {
					$rpetCyc.val(Number($('#dailyRpetCyc').val()));			//반복주기 bind
					$rpetEndYmd.val($('#dailyEndYmd').val()); 					//반복종료일 bind
					$('#rpetType').val('D'); //반복유형 bind
					
				} else if (repeatOps == 'weekly') {
					
					if ($('input[name="rpetDd"]').is(':checked') == true) {
						$('#rpetDateType').val('1'); //반복날짜 형태를 요일로 변경(0:날짜, 1:요일)
					} 
					
					$rpetCyc.val(Number($('#weeklyRpetCyc').val()));
					$rpetEndYmd.val($('#weeklyEndYmd').val());
					$('#rpetType').val('W');
					
				} else if (repeatOps == 'monthly') {
					$rpetCyc.val(Number($('#monthlyRpetCyc').val()));
					$rpetEndYmd.val($('#monthlyEndYmd').val());
					$('#rpetType').val('M');
					
				} else if (repeatOps == 'yearly') {
					$rpetCyc.val(Number($('#yearlyRpetCyc').val()));
					$rpetEndYmd.val($('#yearlyEndYmd').val());
					$('#rpetType').val('Y');
				}
				
				$('#rpetYn').trigger('change');
				validateRpetEndYmd(); //반복 종료일 유효성 검사
				
// 				return;
				
				//schedId가 없으면 신규, 있으면 수정으로 controller에서 처리한다.
				$('#frm').prop('action', './setScheduleData').submit();
				
			});
			
			//취소 이벤트
			$("#cancel").on('click', function(e) {
				
// 				renderView();
// 				history.back();
// 				e.preventDefault();
				
				$(location).prop('href', 'javascript:history.go(-1)');
				
			});
			
		}); //ready End
		
		function addZero(obj) {
			obj= '0'+obj;
			return obj;
		}
		
		/** 종일 체크박스 이벤트 함수 **/
		function allDayEvent(allDay) {
			if(allDay.is(':checked')) {
				$('#startTm').attr('disabled', true);
				$('#endTm').attr('disabled', true);
			}
			else {
				$('#startTm').attr('disabled', false);
				$('#endTm').attr('disabled', false);
			}
		}
		
		/** 반복 체크박스 이벤트 함수 **/
		function repeatEvent(opt) {
			 {
				//종료일 bind
				var startYmd = $('#startYmd').val();
				var date = new Date(startYmd);
				date.setMonth(date.getMonth()+1);
				var rpetEndYmd = date.format("yyyy-MM-dd");
				
				$('#dailyEndYmd').datepicker('update', rpetEndYmd);
			 }
			
			if(opt.is(':checked')) {
				$('#rpetOption').show();
				$('#rpetYn').val("Y");
			}
			else {
				$('#rpetOption').hide();
			}
		}
		
		function repeatOption() {
			var option;
			
			$('.nav-tabs').find('li').each(function(idx) {
				  if($(this).hasClass('active'))
					  option = $(this).find('a').prop('href').split('#');
			});
			
			return option[1];
		}
		
		//** 반복 옵션 클릭시 종료일 bind Event **//
		function rpetTitleEvent(dayOption) {
			var startYmd = $('#startYmd').val(); //일시
			var date = new Date(startYmd);
			var rpetEndYmd;
			
			if (dayOption == 'daily') {
				date.setMonth(date.getMonth()+1);
				rpetEndYmd = date.format("yyyy-MM-dd");
				
				$('#dailyEndYmd').datepicker('update', rpetEndYmd);
				
			} else if (dayOption == 'weekly') {
				date.setMonth(date.getMonth()+1);
				rpetEndYmd = date.format("yyyy-MM-dd");
				
				$('#weeklyEndYmd').datepicker('update', rpetEndYmd);
				
			} else if (dayOption == 'monthly') {
				date.setFullYear(date.getFullYear()+1);
				rpetEndYmd = date.format("yyyy-MM-dd");
				
				$('#monthlyEndYmd').datepicker('update', rpetEndYmd);
				
			} else if (dayOption == 'yearly') {
				date.setFullYear(date.getFullYear()+1);
				rpetEndYmd = date.format("yyyy-MM-dd");
				
				$('#yearlyEndYmd').datepicker('update', rpetEndYmd);
			}
			
		}
		
		//** 반복 종료일 유효성 검사 **//
		function validateRpetEndYmd() {
			var $state = $('input[name=infinite]');
			var rpetInfinite = $state.is(':checked'); //무한반복 체크박스
			var $rpetEndYmd = $('#rpetEndYmd'); //반복 종료일
			
			if ($('#rpetYn').is(':checked')) 
			{
				var rpetEndYmdVal = $rpetEndYmd.val();
				$('#unlmtRpetYn').val('N'); //무한반복 default 'N
				
				if (rpetEndYmdVal== "" && rpetInfinite == false) {
					
					toastrAlert('error', '종료일을 입력해주세요.');
					return false;
				}
				else 
				{
					if(rpetInfinite == false) {
						var rpetStartYmd = $('#startYmd').val().replace(/-/g, ''); //반복 시작일
						
						if (rpetStartYmd > rpetEndYmdVal.replace(/-/g, '')) {
							toastrAlert('error', '시작일이 종료일보다 작을 수 없습니다.');
							return false;
						}
					} else {
						$('#unlmtRpetYn').val('Y'); //무한반복 
					}
					
				}
			}
			
		}
		
	</script>