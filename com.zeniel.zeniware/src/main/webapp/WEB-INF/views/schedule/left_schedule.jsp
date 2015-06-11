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
					 });
					 
					 
				
				</script>
			</div>
		</div>
	</div>
	
	<script>

	</script>
	
<!-- 	<div class="sidebar-menu-inner"> -->
	

		<div class="calendar-env">

		</div>
				
		<ul id="main-menu" class="main-menu">
			<!-- add class "multiple-expanded" to allow multiple submenus to open -->
			<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
			
			<li>a</li>
			
		</ul>
		
<!-- 	</div> -->
		
</div>