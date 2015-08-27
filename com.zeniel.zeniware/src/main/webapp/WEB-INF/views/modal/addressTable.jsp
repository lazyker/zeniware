<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="panel panel-flat">

	<div class="panel-body">
		
		<div class="row">
			<div class="col-sm-1">
				<label class="control-label">시도</label>
			</div>
			<div class="col-sm-3">
				<select id="sboxSido">
					<option></option>
				</select>
			</div>
			<div class="col-sm-1">
				<label class="control-label">시군구</label>
			</div>
			<div class="col-sm-3">
				<select id="sboxSigu">
					<option></option>
				</select>
			</div>
			<div class="col-sm-4">
				<div class="input-group">
					<input type="text" class="form-control" id="txtSearch" />
					<span class="input-group-addon" id="btnSearch"><i class="linecons-search"></i></span>
				</div>
			</div>
		</div>

		<table id="tblAddress" class="table table-small-font middle-align table-hover">
			<thead>
				<tr>
					<th class="no-sorting">우편번호</th>
					<th class="no-sorting">도로명주소</th>
					<th class="no-sorting">지번주소</th>
				</tr>
			</thead>
		</table>
		
	</div>
	
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		sboxInit();
		
		/* sbox data binding */
		$.getJSON('http://doro.zeniel.co.kr/new/getData_sido.html?callback=?', function(data) {
			$.each(data, function(index, element) {
				$('#sboxSido').append('<option value="' + element.local_code + '">' + element.local_name + '</option>');
			});
		});
		
		/* sbox data binding */
		$('#sboxSido').on('change', function() {
			$('#sboxSigu').html('<option></option').select2({ placeholder: '선택하세요...', allowClear: true });
			
			$.getJSON('http://doro.zeniel.co.kr/new/getData_sigu.html?sido=' + $(this).val() + '&callback=?', function(data) {	
				$.each(data, function(index, element) {
					$('#sboxSigu').append('<option value="' + element.local_name + '">' + element.local_name + '</option>');
				});
			});
		});
		
		/* 주소 검색 */
		$('#btnSearch').on('click', function() {
			var prmSido = encodeURIComponent($('#sboxSido').val());
			var prmSigu = encodeURIComponent($('#sboxSigu').val());
			var prmSearch = encodeURIComponent($('#txtSearch').val());
			
			if (prmSido.length == 0) {
				toastrAlert('error', '시도를 선택하세요.');
				return;
			}
			
			if (prmSigu.length == 0) {
				toastrAlert('error', '시군구를 선택하세요.');
				return;
			}
			
			if (prmSearch.length == 0) {
				toastrAlert('error', '검색어를 입력하세요.');
				return;
			}
			
			var sUrl = 'http://doro.zeniel.co.kr/new/getData_addr.html';
			var sUri = '?sido=' + prmSido  + '&sigu=' + prmSigu + '&searchstring=' + prmSearch + '&callback=?';

			$('#tblAddress').DataTable().ajax.url(sUrl + sUri).load();
		})
		
		$('#txtSearch').on('keydown', function(event) {
			if (event.keyCode == 13) {
				$('#btnSearch').trigger('click');
			}
		});
		
		/* addresslist data binding */
		$('#tblAddress').dataTable({
			processing: true, 
			ajax: {
				"url": "${pageContext.request.contextPath}/empty", 
				"dataSrc": ""
			}, 
			deferRender: true, 
			aoColumns: [
				{ "mData": "code", "mRender": function(data, type, full) {
						if (data == 'none') {
							return 'No data available in table';
						} else {
							return data;
						}
					}
				}, 
				{ "mData": null, "mRender": function(data, type, full) {
						var result = '';
						
						if (data.code != 'none') {
							result += data.sido_name + ' ' + data.sigu_name + ' ' + data.road_name;
							result += data.bldg_numb1 == 0 ? ' ' + data.bldg_numb : ' ' + data.bldg_numb + '-' + data.bldg_numb1;
							result += '(' + data.lawd_name;
							result += data.sigu_bldg.length == 0 ? '' : ', ' + data.sigu_bldg;
							result += ')';
						}
						
						return result;
					}
				}, 
				{ "mData": null, "mRender": function(data, type, full) {
						var result = '';
						
						if (data.code != 'none') {
							result += data.sido_name + ' ' + data.sigu_name;
							result += data.ubmy_name.length == 0 ? ' ' : ' ' + data.ubmy_name + ' ' + data.ri_name;						
							result += data.hang_name.length == 0 ? ' ' + data.lawd_name : ' ' + data.hang_name;
	 						result += data.jibn_numb1 == 0 ? ' ' + data.jibn_numb : ' ' + data.jibn_numb + '-' + data.jibn_numb1;
	 						result += ' ' + data.sigu_bldg;
						}
						
						return result;
					}
				}
      ], 
      pageLength: 5, 
      sDom: 'rtip'
		});
		
		/* 주소 선택 */
		$('#tblAddress tbody').on('click', 'tr', function() {
			var curCode = $(this).find('td:eq(0)').html();
			var curAddress = $(this).find('td:eq(1)').html();
			
			if (curAddress.length > 0) {
				$('#txtPostCode').val(curCode);
				$('#txtAddress1').val(curAddress);
				
				$('.bootbox-close-button').trigger('click');
			}
		});
		
	});
	
/* ***References***

*/

</script>

<style>

	.bootbox .modal-body .panel {
		height: 50vh;
		overflow-x: hidden;
		overflow-y: auto;
	}

</style>