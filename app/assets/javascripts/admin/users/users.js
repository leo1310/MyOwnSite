$(document).ready( function (){	
	initialize();	
	searchDetailPanel();
	
});

function initialize(){
	$('#timerange_from').datepicker({dateFormat: 'dd/mm/yy', showAnim: 'slideDown'});
	$('#timerange_to').datepicker({dateFormat: 'dd/mm/yy', showAnim: 'slideDown'});
	
	$('#timerange_from').attr('readonly', 'readonly');
	$('#timerange_to').attr('readonly', 'readonly');

	$('#search_details_body').hide();
}

function searchDetailPanel(){
	var index = 0
	$('#search_details_head').on('click',function(){
		if(index === 0){
			$('#search_details_body').fadeIn(1000,function(){$(this).show(); });
			index = 1;			
		}
		else if(index === 1)
		{
			$('#search_details_body').fadeOut(500,function(){$(this).hide(); });
			index = 0;
		}
		
	});
}