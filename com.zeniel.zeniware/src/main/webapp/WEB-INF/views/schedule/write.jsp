<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-sm-12">
	
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">일정 등록</h3>
			</div>
			
			<div class="panel-body">
				<form role="form" class="form-horizontal">
				
					<div class="form-group">
						<label class="col-sm-1 control-label">제목</label>
						
						<div class="col-sm-9">
							<input type="text" class="form-control" name="schedNm" data-validate="required" data-message-required="제목을 입력해주세요." />
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
							<input type="text" class="form-control" name="place" />
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
									<input type="text" class="form-control datepicker" id="startYmd" data-format="yyyy-mm-dd" value="${startYmd}">
									<input type="text" class="form-control timepicker" id="startTm" data-template="dropdown"  data-show-meridian="false" data-minute-step="30" />
								</div>
							</div>
						</div>
									
						<div class="col-sm-5">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="linecons-calendar"></i>
								</div>
								<div class="date-and-time">
									<input type="text" class="form-control datepicker" id="endYmd" data-format="yyyy-mm-dd" value="${endYmd}">
									<input type="text" class="form-control timepicker" id="endTm" data-template="dropdown" data-show-meridian="false" data-minute-step="30" />
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
								$("#calendarList").selectBoxIt().on('open', function()
								{
									// Adding Custom Scrollbar
									$(this).data('selectBoxSelectBoxIt').list.perfectScrollbar();
								});
							});
						</script>
						
						<div class="col-sm-5">
							<select class="form-control" id="calendarList">
								<option>개인 스케줄</option>
								<option>Option 2</option>
								<option>Option 3</option>
								<option>Option 4</option>
								<option>Option 5</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label" for="field-5">설명</label>
						
						<div class="col-sm-11">
							<textarea class="form-control" rows="3" cols="5" id="field-5" name="memo"></textarea>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-1 control-label">반복</label>
						
						<div class="col-sm-11">
							<div class="form-block">
								<label>
									<input type="checkbox" class="cbr" id="rpetYn">
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group" id="rpetOption" style="display:none;">
						<label class="col-sm-1 control-label"></label>
						
						<div class="col-md-11">
							
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#daily" data-toggle="tab">
										<span class="visible-xs">매일</span>
										<span class="hidden-xs">매일</span>
									</a>
								</li>
								<li>
									<a href="#weekly" data-toggle="tab">
										<span class="visible-xs">매주</span>
										<span class="hidden-xs">매주</span>
									</a>
								</li>
								<li>
									<a href="#monthly" data-toggle="tab">
										<span class="visible-xs">매월</span>
										<span class="hidden-xs">매월</span>
									</a>
								</li>
								<li>
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
												<select class="form-control" id="repeat">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
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
												<input type="text" class="form-control datepicker" name="rpetEndYmd" id="rpetEndYmd" data-format="yyyy-mm-dd">
												
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
												<select class="form-control" id="repeat">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
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
												<input type="checkbox" class="cbr"> 일
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr"> 월
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr"> 화
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr"> 수
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr"> 목
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr"> 금
											</label>
											<label class="cbr-inline">
												<input type="checkbox" class="cbr"> 토
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
												<input type="text" class="form-control datepicker" name="rpetEndYmd" id="rpetEndYmd" data-format="yyyy-mm-dd">
												
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
								
								<div class="tab-pane" id="monthly">
									<div class="form-group">
										<div class="col-md-2">
												<select class="form-control" id="repeat">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
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
												<input type="text" class="form-control datepicker" name="rpetEndYmd" id="rpetEndYmd" data-format="yyyy-mm-dd">
												
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
								
								<div class="tab-pane" id="yearly">
									<div class="form-group">
										<div class="col-md-2">
												<select class="form-control" id="repeat">
													<option value="1">1</option>
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
												<input type="text" class="form-control datepicker" name="rpetEndYmd" id="rpetEndYmd" data-format="yyyy-mm-dd">
												
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
							</div>
							
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12 align-center">
							<button class="btn btn-turquoise">저장</button>
							<button class="btn btn-gray">취소</button>
						</div>
					</div>
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
			
			/** 종일 체크박스 **/
			$('#allDay').on('change', function() {
				allDayEvent($(this));
			});
			
			/** 반복 체크박스 **/
			$('#rpetYn').on('change', function() {
				repeatEvent($(this));
			});
			
			var $state = $('input[name=infinite]');
			
			//무한반복 체크박스 이벤트 
			$state.on('change', function(ev)
			{
				if($(this).is(':checked')) {
					$('input[name=rpetEndYmd]').attr('disabled', true);
					$state.prop('checked', true);  
				}
				else {
					$('input[name=rpetEndYmd]').attr('disabled', false);
					$state.prop('checked', false);
				}
			});
			
// 			 $('#startTm').timepicker().on('changeTime.timepicker', function(e) {
// 				    console.log('The time is ' + e.time.value);
// 				    console.log('The hour is ' + e.time.hour);
// 				    console.log('The minute is ' + e.time.minute);
// 				    console.log('The meridian is ' + e.time.meridian);
// 			});
			
		});
		
		
		/** 종일 체크박스 이벤트 **/
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
		
		/** 반복 체크박스 이벤트 **/
		function repeatEvent(opt) {
			if(opt.is(':checked')) {
				$('#rpetOption').show();
			}
			else {
				$('#rpetOption').hide();
			}
		}
		
	</script>
	