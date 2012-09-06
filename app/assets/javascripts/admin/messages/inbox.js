function buildTable(table_, multicollapsible_) {
	$(table_).find('> tbody').each(function(){ $(this).hide() });

	$(table_).find('> thead:not(".tbl-header")').each(function(){
		$(this).bind('click',function(arg){
			if(arg.target.nodeName != "A") {
				if (!multicollapsible_ ) {				
					//$(table_).find('> tbody').each(function(){$(this).hide()});

					var check_class = $(this).find('tr').attr('class');				
					if (check_class === 'bold'){
						$(this).find('tr').removeClass('bold');
						var message_id = $(this).find('input').val();
						$.ajax({ url: "/messages/message_status",   type: "GET",   data: {id : message_id}});
					}						 				
					
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
			}
		});		
	});
}

$(document).ready( function (){
	buildTable( $('.brep-table'));
});