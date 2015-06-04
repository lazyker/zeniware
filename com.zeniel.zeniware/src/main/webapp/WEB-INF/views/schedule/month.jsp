<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>월간 일정</title>
	
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/assets/js/fullcalendar/fullcalendar.css' />
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/assets/js/fullcalendar/fullcalendar.print.css' media='print' />
	
	<%@ include file="../common/jsForm.jsp" %>
	
	<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/fullcalendar/fullcalendar.js"></script>
	
	<style type='text/css'>
/* 		body { */
/* 		    margin: 40px 10px; */
/* 		    padding: 0; */
/* 		    font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif; */
/* 		    font-size: 14px; */
/* 		} */
/* 		#calendar { */
/* 		    max-width: 900px; */
/* 		    margin: 0 auto; */
/* 		} */
	</style>
	
	<script>
	$(document).ready(function() {
	});
	
	var calendar = null;
	var events = null;

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
		calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			selectable: true,
			selectHelper: true,
			dayClick: function(date, allDay, jsEvent, view) {
				window.alert("dayClick");
				calendar.fullCalendar('unselect');
			},
			eventClick: function(calEvent, jsEvent, view) {
				window.alert("eventClick");
			},
			select: function(start, end, allDay) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			eventMouseover: function( event, jsEvent, view) { 
				window.alert("eventMouseover");
			},
			eventMouseout: function( event, jsEvent, view) { 
				window.alert("eventMouseout");
			},
			eventDrop: function( event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view ) {
				window.alert("eventDrop");
			},
			eventResize:function( event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view ) { 
				window.alert("eventResize");
			},
	 		editable: true,
	 		events: events,
			firstDay: 0,				//---	0. 일요일
			weekends: true,
			allDaySlot: true,
			allDayText: '종일',
			axisFormat : 'hh:mm tt',
			slotMinutes: 30,
			defaultEventMinutes: 60,
			firstHour: 9,
			timeFormat: 'hh:mm tt',
			columnFormat: {month: 'ddd', week: 'M/d ddd', day: 'M/d dddd'},
			titleFormat: {month: 'yyyy년 M월', week: 'yyyy년 M월 d일{ — [yyyy년] [M월] d일 }', day: 'yyy y년 M월 d일 dddd'},
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	 		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	 		buttonText: {today: '오늘', month: '월', week: '주', day: '일'}
		});
	});

// $(document).ready(function() {
		
// 		$('#calendar').fullCalendar({
// 			header: {
// 				left: 'prev,next today',
// 				center: 'title',
// 				right: 'month,agendaWeek,agendaDay'
// 			},
// 			defaultDate: '2014-06-12',
// 			defaultView: 'month',
// 			editable: true,
// 			events: [
// 				{
// 					title: 'All Day Event',
// 					start: '2014-06-01'
// 				},
// 				{
// 					title: 'Long Event',
// 					start: '2014-06-07',
// 					end: '2014-06-10'
// 				},
// 				{
// 					id: 999,
// 					title: 'Repeating Event',
// 					start: '2014-06-09T16:00:00'
// 				},
// 				{
// 					id: 999,
// 					title: 'Repeating Event',
// 					start: '2014-06-16T16:00:00'
// 				},
// 				{
// 					title: 'Meeting',
// 					start: '2014-06-12T10:30:00',
// 					end: '2014-06-12T12:30:00'
// 				},
// 				{
// 					title: 'Lunch',
// 					start: '2014-06-12T12:00:00'
// 				},
// 				{
// 					title: 'Birthday Party',
// 					start: '2014-06-13T07:00:00'
// 				},
// 				{
// 					title: 'Click for Google',
// 					url: 'http://google.com/',
// 					start: '2014-06-28'
// 				}
// 			]
// 		});
		
// 	});

// $('#calendar').fullCalendar({
//     header: {
//         left: 'prev,next today',
//         center: 'title',
//         right: 'month,basicWeek,basicDay'
//     },
//     defaultDate: '2014-11-07',
//     editable: true,
    
//     eventDrop: function(event){
//         event.start._i = event.start.format();
//     },
//     eventResize: function(event) {
//         event.end._i = event.end.format();
//     },
    
//     eventLimit: true, // allow "more" link when too many events
//     events: [{
//         id: 'All Day Event',
//         title: 'All Day Event',
//         start: '2014-11-03'
//     }, {
//         id: 'popo',
//         title: 'popo',
//         start: '2014-11-04T10:30:00',
//         end:   '2014-11-05T12:30:00',
//         description: 'This is a cool event',
//         color: 'rgb(142, 67, 163)',
//         textColor: 'white'
//     }, {
//         id: 'popo2',
//         title: 'popo2',
//         //url: 'http://google.com/',
//         start: '2014-11-06'
//     }]
// });


// $('#calendar').on('click','.fc-day',function(){
//     var myPrompt = prompt('uno','due');
//     if(myPrompt != null && myPrompt != ''){
//         $('#calendar').fullCalendar('addEventSource', [{
//             id: myPrompt,
//             title: myPrompt,
//             start: $(this).attr('data-date')
//         }]);
//     }
// });

// $('#calendar').on('click','.fc-content',function(){
//     var gugu = $(this).children('.fc-title').html();
//     $('#calendar').fullCalendar('removeEvents', gugu);
// });


// $('#bttnAllEvents').click(function(){
//     var myEvents = $("#calendar").fullCalendar("clientEvents");
//     popo = {};
//     for(var i=0; i<myEvents.length; i++){
//         popo[i] = {};
//         if(myEvents[i].id           ){popo[i]['id']          = myEvents[i].id;}
//         if(myEvents[i].title        ){popo[i]['title']       = myEvents[i].title;}
//         if(myEvents[i].start        ){popo[i]['start']       = myEvents[i].start._i;}
//         if(myEvents[i].end          ){popo[i]['end']         = myEvents[i].end._i;}
//         if(myEvents[i].description  ){popo[i]['description'] = myEvents[i].description;}
//         if(myEvents[i].color        ){popo[i]['color']       = myEvents[i].color;}
//         if(myEvents[i].textColor    ){popo[i]['textColor']   = myEvents[i].textColor;}
//     }
//     myPre.innerHTML = JSON.stringify(popo, undefined, 4);
// });

// $('#bttnRecreateEvents').click(function(){
//     for(var i=0; i<Object.keys(popo).length; i++){
//         $('#calendar').fullCalendar('addEventSource', [{
//             id:          popo[i].id,
//             title:       popo[i].title,
//             start:       popo[i].start,
//             end:         popo[i].end,
//             description: popo[i].description,
//             color:       popo[i].color,
//             textColor:   popo[i].textColor
//         }]);
//         console.log('ok');
//     }
// });

	
	</script>
</head>
<body class="page-body horizontal-menu-skin-navy">

	<!-- Top 메뉴 -->
	<%@ include file="../common/topForm.jsp" %>
	
	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		
		<!-- Left 메뉴 -->
		<%@ include file="../common/leftForm.jsp" %>
		
		<div class="main-content">
		
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
				
				<div class="col-sm-12">
					
					<div class="calendar-main">
						
						<div id="calendar"></div>
						
					</div>
					
				</div>
				
				
			</section>
		</div>
		
	</div>
</body>
</html>