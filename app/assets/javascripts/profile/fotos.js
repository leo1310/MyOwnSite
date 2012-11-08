$(document).ready( function (){	

	$('#send_atachment').attr('disabled','disabled');
	$("#foto_album_foto_id").find("option[value='Select Album']").text("Виберіть альбом");

	hide_show_content($('#add_album'), $('#show_album'), $('#show_foto'),  $('#show_edit'), $('#show_edit_foto'));	
	hide_show_content($('#add_foto'), $('#show_foto'),  $('#show_edit'), $('#show_album'), $('#show_edit_foto'));	
	hide_show_content($('#edit_album'), $('#show_edit'), $('#show_album'), $('#show_foto'), $('#show_edit_foto'));
	hide_show_content($('#edit_foto'), $('#show_edit_foto'), $('#show_album'), $('#show_foto'), $('#show_edit'));

	createAlbum();
	changeAlbum();
	editAlbum();
	editFoto();	

	$('.album_click').on('click',function(){
		var title = $(this).attr('title');				
		$('#many_fotos').remove();
		$.ajax({ url: "/display_foto",   type: "GET", data: {album_name: title}});
	});
});
	
function hide_show_content(_subject, content, hide1, hide2, hide3)
{
	var index = 1;
	$(content).hide();
	$(_subject).on('click', function(){		
		if($(hide1).is(':visible')){
			$(hide1).fadeOut(400,function(){$(hide1).hide(); })
		}
		if($(hide2).is(':visible')){
			$(hide2).fadeOut(400,function(){$(hide2).hide(); })
		}
		if($(hide3).is(':visible')){
			$(hide3).fadeOut(400,function(){$(hide3).hide(); })
		}
		if($(content).is(':visible')){
			$(content).fadeOut(400,function(){$(content).hide(); })
		}		
	    else{
	    	$(hide1).fadeOut(400,function(){$(hide1).hide(); })
	    	$(hide2).fadeOut(400,function(){$(hide2).hide(); })
	    	$(hide3).fadeOut(400,function(){$(hide3).hide(); })
	    	$(content).fadeOut(400,function(){$(content).hide(); })
		
		     $(content).fadeIn(700,function(){$(content).show(); })
		}		
	});
}

function createAlbum(){
	$('#create_album').on('click', function(){
		$("#info-error").remove();
		var title = $('#title_album').val();
		var description = $('#description_album').val();
		
		if(title === ''){
			$('#show_album > h5').after('<div id="info-error">Введіть назву Альбому</div>');
			setTimeout(function(){
              $("#info-error").remove();
            }, 4000);
		}
		else if(description === ''){
			$('#show_album > h5').after('<div id="info-error">Введіть короткий опис Альбому</div>');
			setTimeout(function(){
              $("#info-error").remove();
            }, 4000);
		}
		else{
			console.log('Good');
			$("#title_album").attr('value',"");     
			$("#description_album").attr('value',"");     
			$.ajax({ url: "/create_album",   type: "GET", data: {title: title, description: description}});
			
			setTimeout(function(){
              $(".answer_success").remove();
              $(".answer_error").remove();
            }, 4000);
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

function editAlbum(){
	$("#albums_name").change(function(){    
	    var val = $("#albums_name").find("option:selected").val();	   
	    if(val != 'empty'){
	      	$.ajax({ url: "/get_album_name",   type: "GET", data: {album_name: val}});
	    }
	    setTimeout(function(){
              $('.foto').on('click',function(){
              	var val = $(this).attr('value');                           	
              	$('#album_foto_title_foto').val(val);
              })	                  
        }, 200);	    
	});	
}

function editFoto(){
	$("#albums_name_foto_edit").change(function(){ 		  
	    var val = $("#albums_name_foto_edit").find("option:selected").val();	   
	    if(val != 'empty'){
	      	$.ajax({ url: "/foto_edit",   type: "GET", data: {album_name: val}});
	    }
	    setTimeout(function(){              
            $('.move_foto').on('click',function(){
              	
              	var old_album_name = $("#albums_name_foto_edit").find("option:selected").val();

              	$("#info-error").remove();
              	$(".answer_success").remove();
		        $(".answer_error").remove();
              	var foto_id = $(this).attr('value');
              	var album_name = $('#foto_edit_'+foto_id).find('option:selected').val();              	
              	
              	if(album_name === 'empty'){              		
              		$('#form_edit_foto').before('<div id="info-error">Виберіть альбом для переміщення</div>');
					setTimeout(function(){
              			$("#info-error").remove();
            		}, 4000);
              	}              	              	
              	else{
              		$.ajax({ url: "/move_foto",   type: "GET", data: {new_album_name: album_name, id: foto_id, old_album_name: old_album_name}});

              		setTimeout(function(){
		              $(".answer_success").remove();
		              $(".answer_error").remove();
		            }, 6000);
              	}
            });              
        }, 200);
	});	
}