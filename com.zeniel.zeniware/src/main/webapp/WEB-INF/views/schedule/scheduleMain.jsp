<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		var events = null;
		var current_url = null;
		
	 	events = [
					{
						title : 'All Day Event',
						start : '2015-07-14',
						end : '2015-07-16',
				        textColor : 'red',
				        allDay : false
					}
			]
		
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
			eventClick: function(calEventData, jsEvent, view) {
				showSchedModal(calEventData);
				schedEventClick($(this)); //선택한 객체를 전달
			},
			select: function(start, end, allDay, view) {
				if(view.name == "month") {
					//end 날짜를 -1 해야 정상 날짜로 보여진다.(FullCalendr는 00:00 이면 -1일이 됨)
					var date = new Date(end.format());
					date.setDate(date.getDate() - 1);
					end = date.format("yyyy-MM-dd");	
					
					window.location.href = "./write?startYmd=" + start.format() + "&endYmd=" + end;
				}
				else {
					window.location.href = "./write?startYmd=" + start.format() + "&endYmd=" + end.format();				
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
				dropResizeEvent(event);
			},
			eventResize:function( event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view ) { 
				dropResizeEvent(event);
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
			columnFormat: {month: 'ddd', week: 'M/D ddd', day: 'M월D일 dddd'},
			titleFormat: {month: 'YYYY.MM', week: 'MM.DD', day: 'YYYY.MM.DD'},
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	 		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	 		buttonText: {today: '오늘', month: '월간', week: '주간', day: '일간'},
	 		contentHeight: 650,
// 	 		eventLimit: true,
	 		events: function(start, end, timezone, callback) {
	 			schedData(start, end, callback);
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
		
		//일정 상세보기 Modal 삭제 버튼 이벤트
		$('#schedDelBtn').on('click', function() {
			
			if($('#rpet').text() == "") {
				
				if(confirm("삭제 하시겠습니까?"))
					delSched();
				
			} else {
				showSchedRpetModal();
			}
			
		});
		
		$('#schedModifyBtn').on('click', function() {
				var cldrId = $('#cldrId').val();
				var schedId = $('#schedId').val();
			
			window.location.href = "./modify?cldrId=" + cldrId + "&schedId=" + schedId;
		});
		
		$('#schedRpetBtn').on('click', function() {
			delSched();
		});
		
		//반복일정 삭제 취소 버튼 이벤트
		$('#schedRpetCanBtn').on('click', function() {
			$('#schedRpetModal').modal('hide');
		});
		
		
// 		alert($('.navbar-nav').find('a').html());
// 		alert($('.fc-day .fc-widget-content').find('td').html());
		
// 		//Top 메뉴 클릭시 ajax 처리를 위한  location.hash값 저장
// 		var currentPage = $('.title-env > h1').text();
		
// 		checkForHash();
		
// 		$('.fc-day .fc-widget-content').find('td').on("click", function(e) {
// 			document.location.hash = "#" + currentPage;
// 		});
		
	});
	
	//일정 가져오기
	var schedData = function(start, end, callback) {
		
		var year = String(end.year()) + end.month();
		var current_url = null;
		var new_url = './getScheduleData';
		
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
	                    	
							//시간이 없는 경우 종일일정 표시	                    	
							$.each(data, function(i) {
								
								//null 일 경우에 반복일정처럼 묶여서 프로퍼티 삭제
// 								if($(this)[0].id === null) {
// 									delete $(this)[0].id;
// 								}
	                    		
								if( $(this)[0].startTm === null ) {
									$(this)[0].allDay = true;
								}
							}) 	                    	

							callback(data);
	                    }
					}); //end ajax
				}
	}
	
	//Drop & Resize 이벤트
	var dropResizeEvent = function(event) {
		
		var param = event;
		var url = "./updateDropResizeSchedData";
		$.ajax({
			 url: url,
				data: {
					cldrId : param.cldrId,
					schedId : param.schedId,
					startYmd : param.start.format(),
					endYmd : param.end.format()
				},
				error : function(request) {
					alert("저장 중 오류 발생 [관리자에게 문의 하세요.]");
				}
		});
	}
	
	//일정 클릭시 Modal Event
	var showSchedModal = function(calEventData) {
		var DataHtml;
		
		//스케줄 상세 modal(수정, 삭제)
		$('#schedModal').on('show.bs.modal', function (event) {
			var modal = $(this);
			var startYmdTemp, 
				startYmd, 
				endYmdTemp, 
				endYmd;
			
			var start = calEventData.start.format();
			var end = calEventData.end.format();
			
			if( start.length > 11) {
				startYmdTemp = start.replace("T", " ");
				startYmd = startYmdTemp.substring(0, startYmdTemp.length-3);
				endYmdTemp = end.replace("T", " ");
				endYmd = endYmdTemp.substring(0, endYmdTemp.length-3);
				
			} else {
				startYmd = start;
				endYmd = end;
			}
		  
			modal.find('.modal-title').text(calEventData.title);
			
			var rpetYn = calEventData.rpetYn;
			var rpetType = calEventData.rpetType;
			var rpetCyc = calEventData.rpetCyc;
			var rpetTypeNm;
			
			if(rpetType == 'D') 
				rpetTypeNm = "매일 반복(" + rpetCyc + "일마다)";
			else if(rpetType == 'W')
				rpetTypeNm = "매주 반복(" + rpetCyc + "주마다)";
			else if(rpetType == 'M')
				rpetTypeNm = "매월 반복(" + rpetCyc + "월마다)";
			else if(rpetType == 'Y')
				rpetTypeNm = "매년 반복(" + rpetCyc + "년마다)";
			
			{ //modal body 영역 
				DataHtml = '<div class="row">' +
				'<div class="col-md-12">' +
				'<div class="form-group" style="margin-bottom:0px;">' +
				'<label for="field-1" class="control-label"><p>일시</p></label>' +
				'<span style="margin-left:20px">' + startYmd + ' ~ ' + endYmd + '</span>' +
				'</div></div></div>' +
				'<input type="hidden" id="cldrId" value="' + calEventData.cldrId + '" />' +
				'<input type="hidden" id="schedId" value="' + calEventData.schedId + '" />' +
				'<input type="hidden" id="start" value="' + startYmd + '" />' + 
				'<input type="hidden" id="end" value="' + endYmd + '" />';
				
				if( calEventData.rpetYn == "Y" ) {
					DataHtml += '<div class="row">' +
									'<div class="col-md-12">' +
									'<div class="form-group" style="margin-bottom:0px;">' +
									'<label for="field-1" class="control-label"><p id="rpet">반복</p></label>' +
									'<span style="margin-left:20px">' + rpetTypeNm + '</span>' +
									'</div></div></div>';

				}

				if( calEventData.apntPlc != "" ) {
					DataHtml += '<div class="row">' +
									'<div class="col-md-12">' +
									'<div class="form-group" style="margin-bottom:0px;">' +
									'<label for="field-1" class="control-label"><p>장소</p></label>' +
									'<span style="margin-left:20px">' + calEventData.apntPlc + '</span>' +
									'</div></div></div>';
				}
				if( calEventData.memoCont != "" ) {
					DataHtml += '<div class="row">' +
									'<div class="col-md-12">' +
									'<div class="form-group" style="margin-bottom:0px;">' +
									'<label for="field-1" class="control-label"><p>설명</p></label>' +
									'<span style="margin-left:20px">' + calEventData.memoCont + '</span>' +
									'</div></div></div>';
				}
			}
			
			modal.find('.modal-body').html(DataHtml);
			
			$('#schedModal').off('show.bs.modal');
			
		}).addClass("fade").modal('show', {backdrop: 'static'});
	}
	
	//삭제 
	var delSched = function() {
		var url = "./delScheduleData";
		var delType = $(':radio[name="rpetDelOption"]:checked').val();
	
		if (delType == undefined) {
			delType = "single";
		}
		alert(delType);
		return;
		$.ajax({
			 url: url,
				data: {
					cldrId : $('#cldrId').val(),
					schedId : $('#schedId').val(),
					start : $('#start').val(),
					end : $('#end').val(),
					delType : delType
				},
				success : function(data) {
					var delObj= schedEventClick();
					delObj.remove();
					
					$('#schedModal').modal('hide');
// 					window.location.reload();
				},
				error : function(request) {
					alert("삭제 중 오류 발생 [관리자에게 문의 하세요.]");
				}
		});
	}
	
	//반복일정 삭제 옵션 Modal Event 
	var showSchedRpetModal = function() {
		$("#schedModal").removeClass("fade").modal("hide");
		$('#rpetAll').prop('checked', true);
// 		$(".modal-backdrop").fadeOut("slow");
	    
	    $("#schedRpetModal").on('hidden.bs.modal', function (event) {
	    	$("#schedRpetModal").removeClass("fade");
	    	$('#rpetAll').prop('checked', false);
	    	$('#rpetOne').prop('checked', false);
	    	
	    	$('#schedRpetModal').off('hidden.bs.modal');
	    }).modal("show").addClass("fade");
	    
	}
	
	//객체를 반환하는 클로져
	var schedEventClick = function() {
		var privateObj;
		
		function getInstance(paramObj) {
			if (!privateObj || paramObj != undefined) {
				privateObj = paramObj;
			}
			
			return privateObj;
		}
		
		return getInstance;
	}();
	
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