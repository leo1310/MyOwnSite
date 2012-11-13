$(document).ready( function (){
	
	$('#timerange_from').datepicker({dateFormat: 'dd/mm/yy', showAnim: 'slideDown'});
	$('#timerange_to').datepicker({dateFormat: 'dd/mm/yy', showAnim: 'slideDown'});
	
	$('#timerange_from').attr('readonly', 'readonly');
	$('#timerange_to').attr('readonly', 'readonly');

	$('#search_details_body').hide();
	$('#search_details_head').on('click',function(){
		console.log('good');
		$('#search_details_body').fadeIn(1000,function(){$(this).show();	});
	});


});