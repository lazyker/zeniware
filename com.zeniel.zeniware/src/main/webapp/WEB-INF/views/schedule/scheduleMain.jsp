<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script>
	
// 	events = [
// 	    {
// 	        title: 'Long Event',
// 	        start: new Date(y, m, d-5),
// 	        end: new Date(y, m, d-2),
// 	        color: 'red',
// 	        backgroundColor: 'yellow',
// 	        borderColor: 'blue',
// 	        textColor: 'green',

// 	        uid: 'event_0003',                     //--- Customize한 속성
// 	        flagCheckbox: true                     //--- Customize한 속성
// 	    }
// 	];

	$(document).ready(function() {
			loadCal();
	});
	
	function loadCal() {
		
		var calendar = null;
// 		var events = null;
		var current_url = null;
		
// 	 	events = [
// 					{
// 						title : 'All Day Event',
// 						start : '2015-07-14',
// 						end : '2015-07-16',
// 				        textColor : 'red',
// 				        allDay : false
// 					}
// 			]
		
		calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			buttonIcons: {
				prev: 'prev fa-angle-left',
				next: 'next fa-angle-right',
			},
			selectable: true,
			selectHelper: true,
// 			dayClick: function(date, allDay, view) {
// 				var now = moment();
// 				now =  now.set('hour', moment().get('hour')+1);
// 				var endTm = now.get('hour') + ":" + now.get('minute');
// 				var form = "";
// 				var url = "${pageContext.request.contextPath}/schedule/write";
// 				var target = ".main-content";
// 				var target = ".page-body";
// 				var Type = "GET";
// 				var returnType = "html";
// 				var contentType = null;
// 				var async = false;
// 				var $result = callAjax(form, url, target, Type, returnType, contentType, async);

// 				window.location.href = "${pageContext.request.contextPath}/schedule/write?startYmd=" + date.format();
				
// 				calendar.fullCalendar('unselect');
// 			},
			eventClick: function(calEvent, jsEvent, view) {
				window.alert("eventClick");
			},
			select: function(start, end, allDay, view) {
				
				if(view.name == "month") {
					//end 날짜를 -1 해야 정상 날짜로 보여진다.(FullCalendr는 00:00 이면 -1일이 됨)
					var date = new Date(end.format());
					date.setDate(date.getDate() - 1);
					end = date.format("yyyy-MM-dd");	
					
					window.location.href = "${pageContext.request.contextPath}/schedule/write?startYmd=" + start.format() + "&endYmd=" + end;
				}
				else {
					window.location.href = "${pageContext.request.contextPath}/schedule/write?startYmd=" + start.format() + "&endYmd=" + end.format();				
				}
				
				
// 				var title = prompt('Event Title:');
// 				if (title) {
// 					calendar.fullCalendar('renderEvent',
// 						{
// 							title: title,
// 							start: start.format(),
// 							end: end.format()
// 						},
// 						true // make the event "stick"
// 					);
// 				}
				calendar.fullCalendar('unselect');
			},
// 			eventMouseover: function( event, jsEvent, view) { 
// 				window.alert("eventMouseover");
// 			},
// 			eventMouseout: function( event, jsEvent, view) { 
// 				window.alert("eventMouseout");
// 			},
			eventDrop: function( event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view ) {
				window.alert("eventDrop");
			},
			eventResize:function( event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view ) { 
				window.alert("eventResize");
			},
	 		editable: true,
			firstDay: 0,				//---	0. 일요일
			weekends: true,
			allDaySlot: true,
			allDayText: '종일',
			axisFormat : 'HH:mm',
			slotMinutes: 30,
			defaultEventMinutes: 60,
			firstHour: 9,
			timeFormat: 'HH:mm',
			columnFormat: {month: 'ddd', week: 'M/d ddd', day: 'M/d dddd'},
			titleFormat: {month: 'YYYY.MM', week: 'MM.DD', day: 'YYYY.MM.DD'},
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	 		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	 		buttonText: {today: '오늘', month: '월간', week: '주간', day: '일간'},
	 		contentHeight: 650,
	 		events: function(start, end, timezone, callback) {
	 			var year = String(end.year()) + end.month();
	 			var new_url = '${pageContext.request.contextPath}/schedule/getScheduleData';

	 				if( new_url != current_url ){
	 					
	 	                $.ajax({
	 	                    url: new_url,
	 	                    dataType: 'json',
	 	                    type: 'POST',
							data: {
								startYmd : start.format(),
								endYmd : end.format()
							},
	 	                    success: function( data ) {
								var events = [];
// 	 	                        current_url = new_url;
// 	 	                        user_events = response;
// 	 	                        events.push(data);
								callback(data);
	 	                    }
	 	                }); //end ajax
	 	              
	 	           }else{
	 	               callback(user_events);
	 	           }
	 		}
		});
		
	}
	
	function checkForHash() {
		if(document.location.hash){
			var HashLocationName = document.location.hash;
	        HashLocationName.replace("#","");
	        
		}	
	}
	
	$(document).ready(function() {
		
// 		alert($('.navbar-nav').find('a').html());
// 		alert($('.fc-day .fc-widget-content').find('td').html());
		
// 		//Top 메뉴 클릭시 ajax 처리를 위한  location.hash값 저장
// 		var currentPage = $('.title-env > h1').text();
		
// 		checkForHash();
		
// 		$('.fc-day .fc-widget-content').find('td').on("click", function(e) {
// 			document.location.hash = "#" + currentPage;
// 		});
		
		
	});
	
	</script>
	
		<div class="page-title">
			
			<div class="title-env">
				<h1 class="title">Calendar</h1>
				<p class="description">Events management calendar</p>
			</div>
		
			<div class="breadcrumb-env">
				<ol class="breadcrumb bc-1" >
					<li>
						<a href="dashboard-1.html"><i class="fa-home"></i>Home</a>
					</li>
					<li>
						<a href="extra-gallery.html">Extra</a>
					</li>
					<li class="active">
							<strong>Calendar</strong>
					</li>
				</ol>
			</div>
			
		</div>
		
			<section class="calendar-env">
				<div class="col-md-12">
					
					<div class="calendar-main">
						
						<div id="calendar"></div>
						
					</div>
					
				</div>
			</section>
			
			<div id="log"></div>
			
	<script>
	
	var object1 = {
			  apple: 0,
			  banana: {weight: 52, price: 100},
			  cherry: 97
	};
			var object2 = {
			  banana: {price: 200},
			  durian: 100
	};

	/* merge object2 into object1 */
	$.extend(object1, object2);
	
	var printObj = typeof JSON != "undefined" ? JSON.stringify : function(obj) {
		  var arr = [];
		  $.each(obj, function(key, val) {
		    var next = key + ": ";
		    next += $.isPlainObject(val) ? printObj(val) : val;
		    arr.push( next );
		  });
		  return "{ " +  arr.join(", ") + " }";
	};
	
	
	$("#log").append( printObj(object1) );
	
	</script>