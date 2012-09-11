$(document).ready( function (){	
	
	hide_show_content($('#table_personal_info'), $('#personal_info'));
	hide_show_content($('#table_contacts'), $('#contacts'));
	
});

function hide_show_content(_table, id_click)
{
	var index = 1;	
	$(_table).hide();
	$(id_click).on('click', function(){
		if(index === 1){			
			$(_table).fadeIn(700,function(){$(_table).show(); })
			index = 0;
			console.log('open ' + index);
		}
		else{			
			$(_table).fadeOut(400,function(){$(_table).hide(); })
			index = 1;
			console.log('close ' + index);
		}	
	});
}