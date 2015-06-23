<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">일정 등록</h3>
		</div>
		
		<div class="panel-body">
			<form role="form" class="form-horizontal">
			
				<div class="form-group">
					<label class="col-sm-1 control-label">제목</label>
					
					<div class="col-sm-6">
						<input type="text" class="form-control" name="name" data-validate="required" data-message-required="제목을 입력해주세요." />
					</div>
					
						<div class="form-block">
							<label>
								<input type="checkbox" class="cbr"> 비공개
							</label>
						</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-1 control-label">장소</label>
					
					<div class="col-sm-6">
						<input type="text" class="form-control" name="name" />
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-1 control-label">일시</label>
					
					<div class="col-sm-3">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="linecons-calendar"></i>
							</div>
							<div class="date-and-time">
								<input type="text" class="form-control datepicker" id="startYmd" data-format="yyyy-mm-dd" value="${today}">
								<input type="text" class="form-control timepicker" id="startTm" data-template="dropdown"  data-show-meridian="true" data-minute-step="5" data-second-step="5" />
							</div>
						</div>
					</div>
								
					<div class="col-sm-3">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="linecons-calendar"></i>
							</div>
							<div class="date-and-time">
								<input type="text" class="form-control datepicker" id="endYmd" data-format="yyyy-mm-dd" value="${today}">
								<input type="text" class="form-control timepicker" id="endTm" data-template="dropdown" data-show-meridian="true" data-minute-step="5" data-second-step="5" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-1 control-label">종일</label>
					
					<div class="col-sm-4">
						<div class="form-block">
							<label>
								<input type="checkbox" class="cbr" id="allDay">
							</label>
						</div>
					</div>
				</div>
				
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
					
					<div class="col-sm-2">
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
					
					<div class="col-sm-5">
						<textarea class="form-control" cols="5" id="field-5"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-1 control-label">반복</label>
					
					<div class="col-sm-4">
						<div class="form-block">
							<label>
								<input type="checkbox" class="cbr" id="repeat">
							</label>
						</div>
					</div>
					
					<script type="text/javascript">
// 						jQuery(document).ready(function($)
// 						{
// 							$("#repeat").selectBoxIt().on('open', function()
// 							{
// 								// Adding Custom Scrollbar
// 								$(this).data('selectBoxSelectBoxIt').list.perfectScrollbar();
// 							});
// 						});
					</script>
					
<!-- 					<div class="col-sm-2"> -->
<!-- 						<select class="form-control" id="repeat"> -->
<!-- 							<option>없음</option> -->
<!-- 							<option>매일</option> -->
<!-- 							<option>매주</option> -->
<!-- 							<option>매월</option> -->
<!-- 							<option>매년</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
				</div>
				
				<div class="form-group" id="repeatOpt">
					<label class="col-sm-1 control-label"></label>
					
					<div class="col-md-6" style="border:1px solid blue">
						
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
						
						<div class="tab-content" style="border:1px solid black">
							<div class="tab-pane active" id="daily" style="border:1px solid red">
								<div class="col-md-12" style="border:1px solid green">
									<div class="col-md-3" style="border:1px solid orange">
										<select class="form-control" id="repeat" style="width:100px;">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
									</div>
										<p class="text-align7">일마다</p>
								</div>
								
								<div class="form-group"></div>
								
								<div class="form-group">
									<div class="col-md-2">
										<p class="text-align7">시작일로부터 : </p>
									</div>
									
									<div class="col-md-3" style="float:left;">
										<div class="input-group">
											<input type="text" class="form-control datepicker" data-format="yyyy-mm-dd">
											
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
									<div class="col-md-1">
										<p class="text-align7">까지 </p>
									</div>
									<div class="col-md-2">
										<p class="text-align7">무한반복 </p>
									</div>
								</div>
								<div class="form-group">
								
								</div>
								
								
							</div>
							<div class="tab-pane" id="weekly">
								a
							</div>
							<div class="tab-pane" id="monthly">
								b
							</div>
							
							<div class="tab-pane" id="yearly">
									c
							</div>
						</div>
						
						
					</div>
				</div>
				
			</form>
		</div>
		
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			$('#repeatOpt').hide();
			
			$('#allDay').on('click', function() {
				allDayEvent($(this));
			});
			
			$('#repeat').on('click', function() {
				repeatEvent($(this));
			});
		});
		
		
		/** 종일 체크박스 이벤트 **/
		function allDayEvent(allDay) {
			if(allDay.is(':checked') == true) {
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
			if(opt.is(':checked') == true) {
				$('#repeatOpt').show();
			}
			else {
				$('#repeatOpt').hide();
			}
		}
		
	</script>
	