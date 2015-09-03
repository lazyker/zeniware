<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">공휴일 관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href=""><i class="fa-home"></i>Home</a></li>
			<li><a href="">일정관리</a></li>
			<li class="active">공휴일 관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">공휴일 목록</h3>
		
		<div class="panel-options">
			<div class="btn-group">
				<button class="btn btn-white btn-sm" id="btnCreHoliDay">추가</button>
			</div>
		</div>
	</div>
	
	<div class="panel-body">
			<table id="holiDayList" class="table table-small-font table-striped table-hover" cellspacing="0" width="100%">
			</table>
			
		</div>
	</div>
	
<script>

	$(document).ready(function() {
		
// 		$('#holiDayList').dataTable( {
// 	        processing : true,  // show indicator
// 	        serverSide : true,
// 	        ajax: function (data, callback, settings){
// 	        	var params = {
// 	        			draw: data.draw,
// 	                    hldyNm: data.search ? data.search.value : ''
// 	                };
	        	
// 	        	return $.ajax({
// 		            url: "./getHoliDayList",
// 					data: params,
// 					dataType:"json",
// 					success: function(json) {
// 						var result = {
// 		                        draw: data.draw,
// 		                        recordsTotal: 100,
// 		                        recordsFiltered: 2,
// 		                        data: json.data
// 		                    };

// 		                    callback(result);
// 					}
// 	        	});
// 	          },
// 	        columns: [
// 	            { "data": "hldyNm" },
// 	            { "data": "hldyYmd" },
// 	            { "data": "regDate" }
// 	        ]
// 	    } );
		
		var t = $('#holiDayList').DataTable({
			processing : true, 
			ajax: { url: "./getHoliDayList" }, 
			pagingType: "simple_numbers", 
			columns: [
							{ title: 'No', data: null },
					      	{ title: '휴일명', data: 'hldyNm' }, 
					      	{ title: '휴일 날짜', data: 'hldyYmd' }, 
					      	{ title: '등록 날짜', data: "regDate" },
					      	{ title: '수정 날짜', data: "modDate", "visible": false },
					      	{ title: '휴일 아이디', data: "hldyId", "visible": false },
					      	{ title: '회사 아이디', data: "compId", "visible": false }
						    ],
			order: [ [3, "desc"] ],
			fnDrawCallback: function(oSettings) {
// 				/* Need to redo the counters if filtered or sorted */
// 	            if ( oSettings.bSorted || oSettings.bFiltered )
// 	            {
// 	                for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ )
// 	                {
// 	                    $('td:eq(0)', oSettings.aoData[i].nTr ).html( i+1 );
// // 	                	$('td:eq(0)', oSettings.aoData[ oSettings.aiDisplay[i] ].nTr ).html( i+1 );
// 	                }
// 	            }
			}
		});
		
		//컬럼 No 표시
		t.on( 'order.dt search.dt', function () {
	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
		
		$('#holiDayList tbody').on('mouseover', 'tr', function() {
			$(this).addClass('pointer');
		});
		
		$('#holiDayList tbody').on('click', 'tr', function() {
			var rowData = $('#holiDayList').DataTable().row(this).data();
			
			window.location.href = "./holiDayEdit?" + $.param(rowData)
		});
		
		/* 공휴일 등록 */
		$('#btnCreHoliDay').on('click', function() {
			window.location.href = "./holiDayEdit";
		});
		
	});


</script>