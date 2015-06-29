<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="sidebar-menu toggle-others" style="background-color:#E3E3E3;">

	<div class="sidebar-menu-inner">
		<div class="panel-body">
			<div class="form-group">
				<div class="col-sm-12">
					<div class="btn-group" style="width:100%">
						<a class="btn btn-primary btn-lg" style="width:100%">일정 등록</a>
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
		
</div>