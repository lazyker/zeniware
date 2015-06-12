<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="sidebar-menu toggle-others" style="background-color:#dadada">

	<div class="panel-body">
		<div class="form-group">
			<div class="col-sm-5">

				<div class="datepickerCal no-border" id="datepickerCal"></div>

				<script>
// 					$.datepicker.setDefaults($.datepicker.regional['kr']);
					
// 					$(function() {
// 					alert($.fn.datepicker.dates['kr']);
						
// 					});
	
// 	$.fn.datepicker.defaults.format = "mm/dd/yyyy";
	
					 $(function() {
// 						 $('#datepicker12').datepicker({
// 							 startDate: '-3d'
// 							  format: "yyyy-mm-dd",
// 							  startView: 1,
// 							  todayBtn:"linked",
// 							  language: "kr",
// 							  orientation: "top auto",
// 							  keyboardNavigation: false,
// 							  forceParse: false,
// 							  autoclose: true,
// 							  todayHighlight: true
// 						});

						 $('.datepickerCal').datepicker({
							format: "yyyy-mm-dd",
							language: 'kr'
							});
						 
						 $('.datepicker-days .table-condensed tbody').css('background','#b1b1b1');
						 
					 });
					 
					 
				
				</script>
			</div>
		</div>
	</div>
	
	<script>

	</script>
	
<!-- 	<div class="sidebar-menu-inner"> -->
	

		<div class="calendar-env"></div>
		
		<div class="text-right" style="margin-right:15px">
			<a href="#" style="margin-right:3px">
				<i class="fa fa-plus"></i>
			</a>
			
			<a href="#">
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
		
<!-- 	</div> -->
		
</div>