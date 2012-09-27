$(document).ready( function (){	
	
	hide_show_content($('#table_personal_info'), $('#personal_info'));
	hide_show_content($('#table_contacts'), $('#contacts'));
	hide_show_content($('#table_interests'), $('#interests'));
	hide_show_content($('#table_education'), $('#education'));
	hide_show_content($('#table_career'), $('#career'));
	
});

function hide_show_content(_table, id_click)
{
	var index = 1;	
	$(_table).hide();
	$(id_click).on('click', function(){
		if(index === 1){			
			$(_table).fadeIn(700,function(){$(_table).show(); })
			index = 0;
			var val = $(id_click).find('span').attr('value');			
			if(val == 0){
				$(id_click).find('span').css('display', 'inline');						
			}
			else if(val == 1){
				$(id_click).find('span').css('display', 'none');						
			}

			
		}
		else{			
			$(_table).fadeOut(400,function(){$(_table).hide(); })
			index = 1;
			setTimeout(function() {
				$(id_click).find('span').css('display', 'inline');
			}, 500)
			
		}	
	});
}