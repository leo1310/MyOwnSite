$(document).ready( function (){	
	$('#send_atachment').attr('disabled','disabled');
	$("#foto_album_foto_id").find("option[value='Select Album']").text("Виберіть альбом");

	hide_show_content($('#add_album'), $('#show_album'));	
	hide_show_content($('#add_foto'), $('#show_foto'));	

	createAlbum();
	changeAlbum();
		
});
function hide_show_content(_subject, content)
{
	var index = 1;	
	$(content).hide();
	$(_subject).on('click', function(){
		if(index === 1){			
			$(content).fadeIn(700,function(){$(content).show(); })
			index = 0;		
		}
		else{			
			$(content).fadeOut(400,function(){$(content).hide(); })
			index = 1;			
		}	
	});
}

function createAlbum(){
	$('#create_album').on('click', function(){
		var title = $('#title_album').val();
		var description = $('#description_album').val();
		if(title === ''){
			$('#show_album > h5').after('<div id="info-error">Введіть назву Альбому</div>');
			setTimeout(function(){
              $("#info-error").remove();
            }, 5000);
		}
		else if(description === ''){
			$('#show_album > h5').after('<div id="info-error">Введіть короткий опис Альбому</div>');
			setTimeout(function(){
              $("#info-error").remove();
            }, 5000);
		}
		else{
			console.log('Good');
			$("#title_album").attr('value',"");     
			$("#description_album").attr('value',"");     
			$.ajax({ url: "/create_album",   type: "GET", data: {title: title, description: description}});
			
			setTimeout(function(){
              $(".answer_success").remove();
              $(".answer_error").remove();
            }, 9000);
		}		
	});
}

function changeAlbum(){
  $("#foto_album_foto_id").change(function(){    
    var val = $("#foto_album_foto_id").find("option:selected").val();
    console.log(val);
    if(val === 'Select Album'){
      $('#send_atachment').attr('disabled','disabled');
    }  
    else{
      $('#send_atachment').removeAttr('disabled');
    }
  });
}