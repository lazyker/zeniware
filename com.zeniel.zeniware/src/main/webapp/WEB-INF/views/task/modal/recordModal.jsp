<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form role="form" id="frmRecord" method="post" enctype="multipart/form-data">
	<input type="hidden" name="custSeq" value='<c:out value="${param.custSeq}"></c:out>' />
	<input type="hidden" name="userId" value='<c:out value="${recordVo.userId}"></c:out>' />
	<c:if test="${!empty recordVo.recSeq}">
		<input type="hidden" name="recSeq" value='<c:out value="${recordVo.recSeq}"></c:out>' />
	</c:if>

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title"></h4>
	</div>

	<div class="modal-body">

		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">작성일</label>
					<input type="text" class="form-control datepicker" name="recYmd" id="recYmd" data-format="yyyy-mm-dd" value="${recordVo.recYmd}" />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="control-label">업무내용</label>
					<textarea class="form-control" rows="4" name="recCont">${recordVo.recCont}</textarea>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group">
					<label class="control-label">파일첨부</label>
					
					<table class="table table-bordered table-striped" id="advancedDropzone">
						<thead>
							<tr>
								<th width="80%">Name</th>
								<th>Size</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="5">Files list will appear here</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

						
<!-- 							<div id="advancedDropzone" class="droppable-area"> -->
<!-- 								Drop Files Here -->
<!-- 							</div> -->
							

<!-- 			<div class="col-md-12"> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">파일첨부</label> -->
<!-- 					<input type="file" id="fileUpload" class="form-control" name="file" multiple /> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		
	</div>
	
	<div class="modal-footer">
		<div class="form-group">
			<button type="submit" class="btn btn-info">확인</button>
			<button type="reset" class="btn btn-white" data-dismiss="modal">취소</button>
		</div>
	</div>

</form>

<script type="text/javascript">
	
	$(document).ready(function($) {
		/* 저장 */
		$('#frmRecord').validate({
			rules: {
				recYmd: { required: true, maxlength: 10 }, 
				recCont: { maxlength: 250 }
			}, 
			submitHandler: function(form) {
				var status = '${param.status}';
				var url ='./modal/setRecord';
				var formData = new FormData();
				
				if (status != 'new') {
					url = './modal/modRecord';
					formData.append('recSeq', $('input[name=recSeq]').val());
				}
				
				formData.append('recYmd', $('input[name=recYmd]').val());
				formData.append('recCont', $('textarea[name=recCont]').val());
				formData.append('file', $('input[name=file]')[0].files[0]);
				formData.append('custSeq', $('input[name=custSeq]').val());
				formData.append('userId', $('input[name=userId]').val());

	 			$.ajax({
					url: url, 
					data:	formData,
					processData: false,
					contentType: false,
					type: 'POST',
					success: function(data) {
						toastrAlert('success', '저장되었습니다.');
						modalToggle(false);
						
						$('#recordList').DataTable().ajax.reload(null, false);
					} 
				});
	 			
			}
		});
		
		// Datepicker
		if($.isFunction($.fn.datepicker))
		{
			$(".datepicker").each(function(i, el)
			{
				var $this = $(el),
					opts = {
						format: attrDefault($this, 'format', 'yyyy-mm-dd'),
						startDate: attrDefault($this, 'startDate', ''),
						endDate: attrDefault($this, 'endDate', ''),
						daysOfWeekDisabled: attrDefault($this, 'disabledDays', ''),
						startView: attrDefault($this, 'startView', 0),
						language: "kr",
						autoclose: true,
						rtl: rtl()
					},
					$n = $this.next(),
					$p = $this.prev();

				$this.datepicker(opts);

			});
		}
		
		$('#fileUpload').on('change', function() {
			var fileInput = $('#fileUpload');
			var message = "";
			
			if ('files' in fileInput) {
				if (fileInput.files.length == 0) {
                    message = "선택된 파일 없음";
                } else {
                	for (var i = 0; i < fileInput.files.length; i++) {
                        message += "<br /><b>" + (i+1) + ". file</b><br />";
                        var file = fileInput.files[i];
                        if ('name' in file) {
                            message += "name: " + file.name + "<br />";
                        }
                        else {
                            message += "name: " + file.fileName + "<br />";
                        }
                        if ('size' in file) {
                            message += "size: " + file.size + " bytes <br />";
                        }
                        else {
                            message += "size: " + file.fileSize + " bytes <br />";
                        }
                        if ('mediaType' in file) {
                            message += "type: " + file.mediaType + "<br />";
                        }
                    }
                }
			}
			else {
                if (fileInput.val() == "") {
                    message += "Please browse for one or more files.";
                    message += "<br />Use the Control or Shift key for multiple selection.";
                }
                else {
                    message += "Your browser doesn't support the files property!";
                    message += "<br />The path of the selected file: " + fileInput.value;
                }
            }
			alert(message);
			fileInput.text(message);
		});
		
		var $example_dropzone_filetable = $("#advancedDropzone");
		var example_dropzone = $("#advancedDropzone tbody").dropzone({
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

	});
	
</script>

<style type="text/css"> 

	.datepicker {
		z-index: 100000 !important;
	}

</style>