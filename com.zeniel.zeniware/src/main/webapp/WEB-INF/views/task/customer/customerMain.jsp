<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">업무 관리</h1>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href=""><i class="fa-home"></i>Home</a></li>
			<li><a href="">업무관리</a></li>
			<li class="active">고객사 관리</strong></li>
		</ol>
	</div>
	
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">고객사 목록</h3>
		
		<div class="panel-options">
			<div class="btn-group">
				<button class="btn btn-white btn-sm" id="btnCreCustomer">추가</button>
			</div>
		</div>
	</div>
	
	<div class="panel-body">
		<table id="customerList" class="table table-small-font table-striped table-hover" cellspacing="0" width="100%">	</table>
	</div>
</div>
	
<script>

	$(document).ready(function() {
		
		var t = $('#customerList').DataTable({
			processing : true, 
			ajax: { url: "./getCustomerList" }, 
			pagingType: "simple_numbers", 
			columns: [
							{ title: 'No', data: null },
					      	{ title: '거래처명', data: 'custNm' }, 
					      	{ title: '대표자', data: 'custDegt' }, 
					      	{ title: '담당자', data: "userNm" },
					      	{	title: '업무기록', 
					      		data: null, 
					      		mRender: function(o) {return '<span class="badge badge-primary">'+ o.recCnt +'</span>'}
					      	},
					      	{ title: '수정 날짜', data: "modDate", "visible": false },
					      	{ title: '작성자 아이디', data: "userId", "visible": false },
					      	{ title: '회사 아이디', data: "compId", "visible": false }
						    ],
			order: [ [1, "asc"] ],
			fnDrawCallback: function(oSettings) {
				/* Need to redo the counters if filtered or sorted */
	            if ( oSettings.bSorted || oSettings.bFiltered )
	            {
	                for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ )
	                {
	                    $('td:eq(0)', oSettings.aoData[i].nTr ).html( i+1 );
// 	                	$('td:eq(0)', oSettings.aoData[ oSettings.aiDisplay[i] ].nTr ).html( i+1 );
	                }
	            }
			}
		});
		
		//컬럼 No 표시
		t.on( 'order.dt search.dt', function () {
	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
		
		$('#customerList tbody').on('mouseover', 'tr', function() {
			$(this).addClass('pointer');
		});
		
		$('#customerList tbody').on('click', 'tr', function() {
			var rowData = $('#customerList').DataTable().row(this).data();
			
			window.location.href = "./customerEdit?custSeq=" + rowData.custSeq
		});
		
		/* 고객사 등록 */
		$('#btnCreCustomer').on('click', function() {
			window.location.href = "./customerEdit";
		});
		
	});


</script>