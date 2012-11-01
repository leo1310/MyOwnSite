$(document).ready( function (){    
  
  $("#hymn_country_id").select2({ formatResult: format, formatSelection: format }); 
  $("#hymn_country_id").find("option[value='Select country']").text("Виберіть країну"); 
  $("#hymn_country_id").find("option[value='Select country']").attr('value','empty');
  $("#hymn_country_id").find("option[value='Other']").remove();  
});

function format(state){
  if (!state.id){
    return state.text;            
  }
  else{
    if(state.id === "Кот-д'Івуар"){
      return "<img class='flag' src='/assets/flags/little/Кот-дІвуар.png'/>" + state.text;
    }
    if(state.id === "Select country"){
      return "<img class='flag' src='/assets/flags/little/empty.png'/>" + state.text;
    }
    else{
      return "<img class='flag' src='/assets/flags/little/"+ state.id +".png'/>" + state.text;
    }    
  } 
}