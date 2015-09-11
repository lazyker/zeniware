<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="col-sm-12">
	
	<sec:authentication var="user" property="principal" />
	<c:set var="custSeq" value="${custVo.custSeq}" />
	<c:set var="userId" value="${user.userId}" />
	
		<ul class="nav nav-tabs">
			<li class="active">
				<a href="#customer" data-toggle="tab">
					<span class="visible-xs"><i class="fa-home"></i></span>
					<span class="hidden-xs">고객사 정보</span>
				</a>
			</li>
		<c:if test="${!empty custSeq}">
			<li>
				<a href="#record" data-toggle="tab">
					<span class="visible-xs"><i class="fa-user"></i></span>
					<span class="hidden-xs">업무기록</span>
				</a>
			</li>
			<li>
				<a href="#person" data-toggle="tab">
					<span class="visible-xs"><i class="fa-envelope-o"></i></span>
					<span class="hidden-xs">담당자</span>
				</a>
			</li>
		</c:if>
		</ul>
					
		<div class="tab-content">
			<div class="tab-pane active" id="customer">
						
				<div class="panel panel-default">
					<div class="panel-heading">
					<c:choose>
						<c:when test="${empty custSeq}">
							<h3 class="panel-title">고객사 등록</h3>
						</c:when>
						<c:when test="${modState eq 'Y'}">
								<h3 class="panel-title">고객사 수정</h3>
							</c:when>
						<c:otherwise>
							<h3 class="panel-title">고객사 정보</h3>
						</c:otherwise>
					</c:choose>
					</div>
			
					<div class="panel-body">
						<form role="form" id="frm" class="form-horizontal validate" method="post">
						<input type="hidden" name="userId" value='<c:out value="${custVo.userId}"></c:out>' />
						<input type="hidden" name="compId" value='<c:out value="${custVo.compId}"></c:out>' />
					<c:if test="${!empty custSeq}">
						<input type="hidden" name="custSeq" value='<c:out value="${custSeq}"></c:out>' />
					</c:if>
					
					<c:choose>
						<c:when test="${empty custSeq || modState eq 'Y'}">
							<div class="form-group">
									<label class="col-sm-2 control-label">거래처명</label>
									
									<div class="col-sm-4">
										<input type="text" class="form-control" name="custNm" value='<c:out value="${custVo.custNm}"></c:out>' />
									</div>
									
									<label class="col-sm-2 control-label label2">대표자</label>
									
									<div class="col-sm-4">
										<input type="text" class="form-control" name="custDegt" value='<c:out value="${custVo.custDegt}"></c:out>' />
									</div>
								</div>
								
								<div class="form-group-separator"></div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label">법인번호</label>
									
									<div class="col-sm-4">
										<input type="text" class="form-control" name="custCorpn" value='<c:out value="${custVo.custCorpn}"></c:out>' />
									</div>
									
									<label class="col-sm-2 control-label label2">사업자번호</label>
									
									<div class="col-sm-4">
										<input type="text" class="form-control" name="custLices" value='<c:out value="${custVo.custLices}"></c:out>' />
									</div>
									
								</div>
								
								<div class="form-group-separator"></div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label">업종</label>
									
									<div class="col-sm-4">
										<input type="text" class="form-control" name="custTypeNm" value='<c:out value="${custVo.custTypeNm}"></c:out>' />
									</div>
									
									<label class="col-sm-2 control-label label2">E-Mail</label>
									
									<div class="col-sm-4">
										<div class="input-group input-group-sm input-group-minimal">
											<span class="input-group-addon">
												<i class="linecons-mail"></i>
											</span>
											<input type="text" class="form-control"  name="mailId" data-mask="email" value='<c:out value="${custVo.mailId}"></c:out>' />
										</div>
									</div>							
								</div>
								
								<div class="form-group-separator"></div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label">대표전화</label>
									
									<div class="col-sm-4">
										<div class="input-group input-group-sm input-group-minimal">
											<span class="input-group-addon">
												<i class="linecons-mobile"></i>
											</span>
											<input type="text" class="form-control"  name="phone" data-mask="999-9999-9999" value='<c:out value="${custVo.phone}"></c:out>' placeholder="phone" />
										</div>
									</div>
									
									<label class="col-sm-2 control-label">FAX</label>
									
									<div class="col-sm-4">
										<input type="text" class="form-control"  name="fax" data-mask="999-9999-9999" value='<c:out value="${custVo.fax}"></c:out>' placeholder="fax" />
									</div>
								</div>
								
								<div class="form-group-separator"></div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label">사업장 주소</label>
									
									<div class="col-sm-10">
										<input type="text" class="form-control" name="address" value='<c:out value="${custVo.address}"></c:out>' />
										
									</div>
								</div>
								
								<div class="form-group-separator"></div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label">고객사 정보</label>
									
									<div class="col-sm-10">
										<textarea class="form-control" rows="14" name="custInfo"><c:out value="${custVo.custInfo}"></c:out></textarea>
									</div>
								</div>
								
								<div class="form-group-separator"></div>
								
							<div class="row">
								<div class="col-md-12 align-center">
									<button type="button" class="btn btn-turquoise" id="btnSave">저장</button>
									<button type="button" class="btn btn-gray" id="btnCancel">취소</button>
									<button type="button" class="btn btn-gray" id="btnList">목록</button>
								</div>
							</div
						</c:when>
						
						<c:otherwise>
						<!-- 읽기 화면 -->
							<div class="form-group">
								<label class="col-sm-2 control-label2">거래처명</label>
								<div class="col-sm-4">
		<!-- 							<i class="fa-ellipsis-v read"></i> -->
									<p><c:out value="${custVo.custNm}"></c:out></p>
								</div>
								
								<label class="col-sm-2 control-label2 label2">대표자</label>
								
								<div class="col-sm-4">
									<p><c:out value="${custVo.custDegt}"></c:out></p>
								</div>
							</div>
							
							<div class="form-group-separator"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label2">법인번호</label>
								
								<div class="col-sm-4">
									<p><c:out value="${custVo.custCorpn}"></c:out></p>
								</div>
								
								<label class="col-sm-2 control-label2 label2">사업자번호</label>
								
								<div class="col-sm-4">
									<p><c:out value="${custVo.custLices}"></c:out></p>
								</div>
							</div>
							
							<div class="form-group-separator"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label2">업종</label>
								
								<div class="col-sm-4">
									<p><c:out value="${custVo.custTypeNm}"></c:out></p>
								</div>
								
								<label class="col-sm-2 control-label2 label2">E-Mail</label>
								
								<div class="col-sm-4">
									<p><c:out value="${custVo.mailId}"></c:out></p>
								</div>
							</div>
							
							<div class="form-group-separator"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label2">대표전화</label>
								
								<div class="col-sm-4">
									<div class="input-group input-group-sm input-group-minimal">
										<p><c:out value="${custVo.phone}"></c:out></p>
									</div>
								</div>
								
								<label class="col-sm-2 control-label2 label2">FAX</label>
								
								<div class="col-sm-4">
									<c:out value="${custVo.fax}"></c:out>
								</div>
							</div>
							
							<div class="form-group-separator"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label2">사업장 주소</label>
								
								<div class="col-sm-10">
									<p><c:out value="${custVo.address}"></c:out></p>
								</div>
							</div>
							
							<div class="form-group-separator"></div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label2">고객사 정보</label>
								
								<div class="col-sm-10">
									<p><c:out value="${custVo.custInfo}"></c:out></p>
								</div>
							</div>
							
							<div class="form-group-separator"></div>
							
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group">
					<label class="control-label">파일첨부</label>
					
<!-- 												<div id="advancedDropzone" class="droppable-area"> -->
<!-- 								Drop Files Here -->
<!-- 							</div> -->
					
					<table class="table table-bordered table-striped" id="example-dropzone-filetable">
						<thead>
							<tr>
								<th width="80%">Name</th>
								<th>Size</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody id="advancedDropzone">
							<tr>
								<td colspan="5">Files list will appear here</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<script>
		jQuery(document).ready(function($)
				{
					var i = 1,
						$example_dropzone_filetable = $("#example-dropzone-filetable"),
						example_dropzone = $("#advancedDropzone").dropzone({
						url: 'data/upload-file.php',
						
						// Events
						addedfile: function(file)
						{
							if(i == 1)
							{
								$example_dropzone_filetable.find('tbody').html('');
							}
							
							var size = parseInt(file.size/1024, 10);
							size = size < 1024 ? (size + " KB") : (parseInt(size/1024, 10) + " MB");
							
							var $entry = $('<tr>\
											<td class="text-center">'+(i++)+'</td>\
											<td>'+file.name+'</td>\
											<td><div class="progress progress-striped"><div class="progress-bar progress-bar-warning"></div></div></td>\
											<td>'+size+'</td>\
											<td>Uploading...</td>\
										</tr>');
							
							$example_dropzone_filetable.find('tbody').append($entry);
							file.fileEntryTd = $entry;
							file.progressBar = $entry.find('.progress-bar');
						},
						
						uploadprogress: function(file, progress, bytesSent)
						{
							file.progressBar.width(progress + '%');
						},
						
						success: function(file)
						{
							file.fileEntryTd.find('td:last').html('<span class="text-success">Uploaded</span>');
							file.progressBar.removeClass('progress-bar-warning').addClass('progress-bar-success');
						},
						
						error: function(file)
						{
							file.fileEntryTd.find('td:last').html('<span class="text-danger">Failed</span>');
							file.progressBar.removeClass('progress-bar-warning').addClass('progress-bar-red');
						}
					});
					
					$("#advancedDropzone").css({
						minHeight: 200
					});
	
				});
		</script>
							
							<div class="row">
								<div class="col-md-12 align-center">
								<c:if test="${user.userId eq custVo.userId}">
									<button type="button" class="btn btn-turquoise" id="btnMod">수정</button>
									<button type="button" class="btn btn-turquoise" id="btnDel">삭제</button>
								</c:if>
									<button type="button" class="btn btn-gray" id="btnCancel">목록</button>
								</div>
							</div>
							
						</c:otherwise>
					</c:choose>	
						
						</form>
					</div>
				</div>
			</div>
			
			<div class="tab-pane" id="record">
			
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">업무 기록</h3>
						
						<div class="panel-options">
							<div class="btn-group">
							<input type="file" id="fileUpload" class="form-control" name="file" multiple />
								<button class="btn btn-white btn-sm" id="btnCreRecord">추가</button>
							</div>
						</div>
					</div>
					
					<div class="panel-body">
						<table id="recordList" class="table table-model-2 table-hover" cellspacing="0" width="100%">	</table>
					</div>
					
					<script>
						$(function() {
							  $('#recordList').DataTable({
									processing : true, 
									ajax: { url: "./getRecordList", data: { custSeq: '${custSeq}' } },
									pagingType: "simple_numbers",
									columns: [
													{ title: '작성일', data: 'recYmd', width:'10vh' },
											      	{ title: '업무내용', data: 'recCont', width:'50vh' }, 
											      	{ title: '작성자', data: 'userNm', width:'15vh' }, 
											      	{ 
											      		title: '첨부파일', 
											      		data: null, 
											      		width:'10vh',
											      		className:'text-center',
											      		mRender: function(o) {
											      			var fileIcon = "";
											      			if (o.originalFileName != null) {
											      				fileIcon = '<a href="javascript:;" title="' + o.originalFileName + '"><i class="fa fa-file-o"></i></a>'; 
											      			}
											      			return fileIcon;
											      		},
											      		fnCreatedCell: function(nTd, sData, oData, iRow, iCol) {
											      	        $('a', nTd).tooltip();
											      	   }
											      	},
											      	{	title: '', 
											      		data: null,
											      		width: '15vh',
											      		className:'text-center',
											      		mRender: function(o) {
											      			var edit='', del='';
											      			
															if (o.userId == '${userId}') {
																edit='<a href="javascript:modRecord(' + o.recSeq + ');" class="btn btn-secondary btn-sm btn-icon icon-left">수정</a>';
																del='<a href="javascript:delRecord(' + o.recSeq + ')" class="btn btn-danger btn-sm btn-icon icon-left">삭제</a>';
																
															} else {
																edit='<a href="javascript:modRecord(' + o.recSeq + ');" class="btn btn-secondary btn-sm btn-icon icon-left" disabled>수정</a>'
																del='<a href="javascript:delRecord(' + o.recSeq + ')" class="btn btn-danger btn-sm btn-icon icon-left" disabled>삭제</a>';
															}
	
															return edit + del;
											      		}
											      	},
											      	{ title: '수정 날짜', data: "modDate", "visible": false },
											      	{ title: '작성자 아이디', data: "userId", "visible": false },
											      	{ title: '업무기록 번호', data: "recSeq", "visible": false }
												    ],
									order: [ [1, "desc"] ]
								});
							  
							  
								$('#fileUpload').on('change', function() {
									var files = this.files;
									var message = "";
									
									if (files.length == 0) {
					                    message = "선택된 파일 없음";
					                } else {
					                	for (var i = 0; i < files.length; i++) {
// 					                        message += "<br /><b>" + (i+1) + ". file</b><br />";
					                        var file = files[i];
					                        
					                        if ('name' in file) {
					                            message += file.name;
					                        }
					                        else {
					                            message += file.fileName;
					                        }
					                        
// 					                        if ('size' in file) {
// 					                            message += "size: " + file.size + " bytes <br />";
// 					                        }
// 					                        else {
// 					                            message += "size: " + file.fileSize + " bytes <br />";
// 					                        }
// 					                        if ('mediaType' in file) {
// 					                            message += "type: " + file.mediaType + "<br />";
// 					                        }
					                    }
					                }
									$(this).val(message);
									
// 									this.innerHTML = message;
								});
						});
					</script>
				</div>
							
			</div>
			
			<div class="tab-pane" id="person">
			<div class="row">
				<div class="col-md-6">
			
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">담당자</h3>
							
							<div class="panel-options">
								<div class="btn-group">
									<button class="btn btn-white btn-sm" id="btnCrePerson">추가</button>
								</div>
							</div>
						</div>
						
						<div class="panel-body">
							<table id="personList" class="table table-model-2 table-hover" cellspacing="0" width="100%"></table>
						</div>
						
						<script>
							$(function() {
								 $('#personList').DataTable({
										processing : true, 
									 	dom: "t" + "<'row'<'col-xs-6'i><'col-xs-6'p>>",
										ajax: { url: "./getPersonList", data: { custSeq: '${custSeq}' } },
										pagingType: "simple_numbers",
										columns: [
										          		{ title: 'No', data:null },
														{ title: '담당자', data: 'personNm' },
												      	{ title: '직위', data: 'deptNm' }, 
												      	{ title: '작성자 아이디', data: "userId", "visible": false },
												      	{ title: '담당자 번호', data: "personSeq", "visible": false },
												      	{	title: '', 
												      		data: null,
												      		width: '20vh',
												      		className:'text-center',
												      		mRender: function(o) {
												      			var edit='', del='';
												      			
																if (o.userId == '${userId}') {
																	edit="<a href=\"javascript:modPerson('" + o.personSeq + "');\" class='btn btn-secondary btn-sm btn-icon icon-left'>수정</a>";
																	del='<a href="javascript:delPerson(' + o.personSeq + ')" class="btn btn-danger btn-sm btn-icon icon-left">삭제</a>';
																	
																} else {
																	edit='<a href="javascript:modPerson(' + o.personSeq + ');" class="btn btn-secondary btn-sm btn-icon icon-left" disabled>수정</a>'
																	del='<a href="javascript:delPerson(' + o.personSeq + ')" class="btn btn-danger btn-sm btn-icon icon-left" disabled>삭제</a>';
																}
		
																return edit + del;
												      		}
												      	}
													    ],
										order: [ [1, "desc"] ],
										fnDrawCallback: function(oSettings) {
								            if ( oSettings.bSorted || oSettings.bFiltered )
								            {
								                for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ )
								                {
								                    $('td:eq(0)', oSettings.aoData[i].nTr ).html( i+1 );
								                }
								            }
										}
									});
							});
						</script>
					</div>
								
				</div>
				
				<div class="col-md-6">
				
					<!-- Bordered panel -->
					<div class="panel panel-default panel-border">
						<div class="panel-heading">
							담당자 정보
						</div>
						
						<div class="panel-body">
						
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label3">담당자 성명</label>
										<p id="personNm"></p>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label3">부서</label>
										<p id="deptNm"></p>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label3">직위</label>
										<p id="jobTitleNm"></p>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label3">담당업무</label>
										<p id="businessNm"></p>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label3">생년월일</label>
										<p id="birthday"></p>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label3">메일주소</label>
										<p id="mailId"></p>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label3">사무실 번호</label>
										<p id="officePhone"></p>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label3">휴대폰 번호</label>
										<p id="mobilePhone"></p>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="control-label3">메모</label>
										<p id="memo"></p>
									</div>
								</div>
							</div>							
													
						</div>
					</div>
					
				</div>
				
			</div>
		</div>	
		</div>
	
	</div>
</div>

	
	<script>
	
		$(document).ready(function() {
			
			$('.dataTable tbody').addClass("middle-align"); //text 가운데 정렬
			
			//고객사 등록/수정
			$('#btnSave').on('click', function() {
				if ('${custSeq}' == '')
					$('form').prop('action', './setCustomer').submit();
				else
					$('form').prop('action', './modCustomer').submit();
			});
			
			$('#btnMod').on('click', function() {
				window.location.href = "./customerEdit?custSeq=${custSeq}&modState=Y"; 
			});
			
			//고객사 삭제 버튼 이벤트
			$('#btnDel').on('click', function() {
				if (confirm("삭제 하시겠습니까?")) {
					$('form').prop('action', './delCustomer').submit();
				}
			});
			
			//취소 버튼 이벤트
			$("#btnCancel").on('click', function(e) {
				$(location).prop('href', 'javascript:history.go(-1)');
			});
			
			//목록 버튼 이벤트
			$('#btnList').on('click', function() {
				window.location.href = "./customerMain";
			});
			
			//업무기록 추가 이벤트
			$('#btnCreRecord').on('click', function() {
				$.get('./modal/recordModal', { status: "new", custSeq : "${custSeq}" },  function(data) {
					modalToggle(true, data, "업무기록 추가");
				});
			});
			
			//담당자 추가 이벤트
			$('#btnCrePerson').on('click', function() {
				$.get('./modal/personModal', { status: "new", custSeq : "${custSeq}" },  function(data) {
					modalToggle(true, data, "담당자 추가");
				});
			});
			
			$('#personList tbody').on('mouseover', 'tr', function() {
				$(this).addClass('pointer');
			});
			
			//담당자 Row 클릭 이벤트
			$('#personList tbody').on('click', 'tr', function() {
				var table = $('#personList').DataTable();
				var rowData = table.row(this).data();
				
				if ($(this).hasClass('selected') ) {
		            $(this).removeClass('selected');
		        }
		        else {
		            table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected');
		        }
				
				personInit(rowData); //담당자 정보 Bind
			});
			
			//담당자 탭 선택시 첫번째 데이터 가져오기
			$('.nav-tabs').find('li').on('click', function() {
				var tabNm	= $(this).find('span').text();
				
				if (tabNm == "담당자") {
		 			personInit();
				}
				
			});
			
			
		}); //ready End
		
		//담당자 데이터 bind
		var personInit = function(rowData) {
			//첫번째 데이터 선택
			if (rowData == undefined) {
				rowData = $('#personList').DataTable().row(0).data();
				$('#personList tbody').find('tr').eq(0).addClass('selected');
			}
			
			$('#personNm').text(rowData.personNm);
			$('#deptNm').text(rowData.deptNm);
			$('#jobTitleNm').text(rowData.jobTitleNm);
			$('#birthday').text(rowData.birthday);
			$('#mailId').text(rowData.mailId);
			$('#officePhone').text(rowData.officePhone);
			$('#mobilePhone').text(rowData.mobilePhone);
			$('#businessNm').text(rowData.businessNm);
			$('#memo').text(rowData.memo);
		}
		
		//업무기록 수정 Modal
		function modRecord(recSeq) {
			$.get('./modal/recordModal', { status: "modify", custSeq : "${custSeq}", recSeq : recSeq },  function(data) {
				modalToggle(true, data, "업무기록 수정");
			});
		}
		
		//업무기록 삭제
		function delRecord(recSeq) {
			if (confirm("삭제 하시겠습니까?")) {
				$.get('./modal/delRecord', { custSeq : "${custSeq}", recSeq : recSeq, userId : '${userId}' },  function(data) {
					toastrAlert('error', '삭제되었습니다.');
					$('#recordList').DataTable().ajax.reload(null, false);
				});
			}
		}
		
		//담당자 수정 Modal
		function modPerson(personSeq) {
			$.get('./modal/personModal', { status: "modify", custSeq : "${custSeq}", personSeq : personSeq },  function(data) {
				modalToggle(true, data, "업무기록 수정");
			});
		}
		
		//담당자 삭제
		function delPerson(personSeq) {
			if (confirm("삭제 하시겠습니까?")) {
				$.get('./modal/delPerson', { custSeq : "${custSeq}", personSeq : personSeq, userId : '${userId}' },  function(data) {
					toastrAlert('error', '삭제되었습니다.');
					$('#personList').DataTable().ajax.reload(null, false);
				});
			}
		}
		
	</script>