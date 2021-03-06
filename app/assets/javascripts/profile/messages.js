var count_check = 0;
function buildTable(table_, multicollapsible_) {
	$(table_).find('> tbody').each(function(){ $(this).hide() });

	$(table_).find('> thead:not(".tbl-header")').each(function(){
		$(this).bind('click',function(arg){			

			if(arg.target.nodeName == "INPUT"){				
				if ( $(this).find("input[type='checkbox']").attr('checked') === 'checked'){
					count_check += 1;					
					$("#cheked_message").remove();
					if(count_check == 1 || count_check == 2 || count_check == 3 || count_check == 4 || count_check == 21 || count_check == 22 || count_check == 23 || count_check == 24){
						$(".brep-table").before("<div style='margin-left: 115px' id='cheked_message'>Обрано "+ count_check +" повідомлення<a style='float:right; margin-right: 100px' href='/messages/delete_messages'>Видалити обрані повідомлення</a></div>");	
					}
					else{
						$(".brep-table").before("<div style='margin-left: 115px' id='cheked_message'>Обрано "+ count_check +" повідомлень<a style='float:right; margin-right: 100px' href='/messages/delete_messages'>Видалити обрані повідомлення</a></div>");	
					}
					
				}
				else{
					count_check -= 1;					
					$("#cheked_message").remove();				
					if( count_check > 0){
						if(count_check == 1 || count_check == 2 || count_check == 3 || count_check == 4 || count_check == 21 || count_check == 22 || count_check == 23 || count_check == 24 ){
							$(".brep-table").before("<div style='margin-left: 115px' id='cheked_message'>Обрано "+ count_check +" повідомлення<a style='float:right; margin-right: 100px' href='/messages/delete_messages'>Видалити обрані повідомлення</a></div>");						
						}
						else{
							$(".brep-table").before("<div style='margin-left: 115px' id='cheked_message'>Обрано "+ count_check +" повідомлень<a style='float:right; margin-right: 100px' href='/messages/delete_messages'>Видалити обрані повідомлення</a></div>");						
						}
					}
						
				}
			}
			if(arg.target.nodeName != "INPUT" && arg.target.nodeName != "A") {
				if (!multicollapsible_ ) {				
					
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