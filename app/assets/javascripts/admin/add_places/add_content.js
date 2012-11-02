$(document).ready( function (){    
  
  //--------------------   initialize components -----------------------------------------------
  $("#hymn_country_id").select2({ formatResult: format, formatSelection: format }); 
  $("#hymn_country_id").find("option[value='Select country']").attr('value','empty');
  $("#hymn_country_id").find("option[value='empty']").text("Виберіть країну");
  $("#hymn_country_id").find("option[value='empty']").attr("selected","selected"); 
  
  $("#hymn_country_id").find("option[value='Other']").remove();
  $('#send_atachment').attr('disabled','disabled');
  console.log($("#hymn_country_id").find("option:selected"))

  changeCountry();
});

function format(state){
  if (!state.id){
    return state.text;            
  }
  else{
    if(state.id === "Кот-д'Івуар"){
      return "<img class='flag' src='/assets/flags/little/Кот-дІвуар.png'/> " + state.text;
    }
    if(state.id === "Select country"){
      return "<img class='flag' src='/assets/flags/little/empty.png'/> " + state.text;
    }
    else{
      return "<img class='flag' src='/assets/flags/little/"+ state.id +".png'/> " + state.text;
    }    
  } 
}

function changeCountry(){
  $("#hymn_country_id").change(function(){    
    var val = $("#hymn_country_id").find("option:selected").val();
    console.log(val);
    if(val === 'empty'){
      $('#send_atachment').attr('disabled','disabled');
    }  
    else{
      $('#send_atachment').removeAttr('disabled');
    }
  });
}