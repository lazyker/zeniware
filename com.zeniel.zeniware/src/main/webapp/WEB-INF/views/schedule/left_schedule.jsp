<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		<a href="javascript:;" onclick="showAjaxModal();" style="margin-right:3px">
			<i class="fa fa-plus"></i>
		</a>
		
		<a href="javascript:;" onclick="delCalendar();">
			<i class="fa fa-minus"></i>
		</a>
	</div>
	
			
	<ul id="calendar-menu" class="calendar-menu">
	
		<li>
			<label>
				<input type="checkbox" class="cbr cbr-info"> 개인 스케줄
			</label>
		</li>
		<li>
			<label>
				<input type="checkbox" class="cbr cbr-danger"> 회사 스케줄
			</label>
		</li>
		
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
				<input type="checkbox" class="cbr cbr-info"> 개인 스케줄
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
									<input type="text" class="form-control colorpicker" data-format="hex" id="cldrColorVal" />
									
									<div class="input-group-addon">
										<i class="color-preview"></i>
									</div>
								</div>
							</div>	
							
						</div>
					</div>
				
				</div>
					<div id="chkVal" style="display:none;border-color: #cc3f44;color: #cc3f44">※ 값이 모두 입력되지 않았습니다.</div>
	
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
			
			$('#saveCal').on('click', function() {
				
				var $cldrNmVal = $('#cldrNm');
				var $cldrColorVal = $('#cldrColorVal');
				
				if ($cldrNmVal.val() == "" || $cldrColorVal.val() == "") {
					$('#chkVal').show();
					setTimeout(function() {
						$('#chkVal').hide();
					}, 1000);
					 return false;
				}

				addCalendar();
			});
			
		});
		
			function showAjaxModal()
			{ 
				//모달 초기화
				$('#cldrNm').val("");
				$('#cldrColorVal').val("");
				
				$('#calendarModal').modal('show', {backdrop: 'static'});
			}
			
			function addCalendar() 
			{
				$.ajax({
					url: '${pageContext.request.contextPath}/schedule/addCalendar',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					data: {
						cldrNm : $('#cldrNm').val(),
						cldrColorVal : $('#cldrColorVal').val()
					},
					success: function(data)
					{
						var obj = JSON.parse(data);
						var calendarListStr = 
							"<li>" +
							"<label>" +
							"<input type='checkbox' class='cbr cbr-gray'>" + obj.cldrNm + 
							"</label>" +
							"</li>"
						
						$('#calendar-menu').append(calendarListStr);
						//체크박스 설정(xenon cbr_replace 함수 커스터마이징)	
						calCbrReplace(obj.cldrColorVal);
						
					}
				});
				
				$('#cldrNm').val("");
				$('#cldrColorVal').val("");
				$('#calendarModal').modal('hide');
		}
			
			
			function delCalendar() {
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