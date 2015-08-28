/**
 * 
 */

/* bootstrap modal toggle */
function modalToggle(option, data, title) {
	if (option == true) {
		$('.modal .modal-content').html(data);
		
		if (!jQuery.isEmptyObject(title)) {
			$('.modal .modal-title').html(title);
		}

		jQuery('.modal').modal('show', { backdrop: 'fade' });
		
	} else {
		jQuery('.modal').modal('hide');
	}
};

/* create json object from named elements inside form tag */
function createNameElements() {
	var jsonItem = {};

	$.each($('form *[name]'), function(index, element) {
		if (element.name.length > 0) {
			if (element.type == 'checkbox') {
				jsonItem[element.name] = element.checked;
			} else {
				jsonItem[element.name] = element.value;
			}
		}
	});

	return JSON.stringify(jsonItem);
}

function sboxInit(object) {
	var element = jQuery.isEmptyObject(object) ? 'select' : object;

	$(element).select2({
		placeholder: "선택하세요...", 
		allowClear: true
	}).on('select2-open', function() {
		$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
	});
}

function dataTableCheckboxRender() {
	var $state = $(".dataTable thead input[type='checkbox']");
	
	$(".dataTable").on('draw.dt', function() {
		cbr_replace();
		$state.trigger('change');
	});
	
	$state.on('change', function(ev) {
		var $chcks = $(".dataTable tbody input[type='checkbox']");
		
		if ($state.is(':checked')) {
			$chcks.prop('checked', true).trigger('change');
		} else {
			$chcks.prop('checked', false).trigger('change');
		}
	});
}

$(document).ready(function() {
	
	$('.modal').on('hidden.bs.modal', function (event) {
		$('.modal .modal-content').html("");
	});
	
	sboxInit();
	dataTableCheckboxRender();
});
