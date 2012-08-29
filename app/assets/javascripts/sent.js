function buildTable(table_, multicollapsible_) {
	$(table_).find('> tbody').each(function(){ $(this).hide() });

	$(table_).find('> thead:not(".tbl-header")').each(function(){
		$(this).bind('click',function(){
			if (!multicollapsible_ ) {							 				
				
			}			
			if ( $(this).next('tbody').is(':visible') ) {
				$(this).next('tbody').fadeOut(100,function(){ $(this).hide(); });		
			}
			else {
				$(table_).find('> tbody').each(function(){ $(this).hide(); });
						
				$(this).next('tbody').fadeIn(300,function(){$(this).show();	});									
			}
			
			$(this).toggleClass('tbl-row-opened');
			return false;
		});		
	});
}

$(document).ready( function (){
	buildTable( $('.brep-table'));
});