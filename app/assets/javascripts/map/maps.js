var map;
var marker;

function initialize(Y_coordinat, X_coordinat, zoom, title) {
        var myOptions = {
          center: new google.maps.LatLng(Y_coordinat, X_coordinat),
          zoom: zoom,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);

        marker = new google.maps.Marker({
            position: map.getCenter(),
            map: map,
            title: title
        });                
      }          

$(document).ready( function (){
  add_description_about_country();  
  add_description_about_capital();
  add_description_about_city();
  /*var zoom = parseInt($("#part_of_the_world_data").attr("data-zoom")),
      X_coordinat = $("#part_of_the_world_data").attr("data-coordinateX"),
      Y_coordinat = $("#part_of_the_world_data").attr("data-coordinateY"),
      name = $("#part_of_the_world_data").attr("data-name");                  
  initialize(Y_coordinat, X_coordinat, zoom, name);*/
  
  initialize(-18.920, 407.530, 8, 'title');
  $("#country").find("option[value='empty']").attr("selected", "selected");
  $("#capital").find("option[value='empty']").attr("selected", "selected");
  $("#city").find("option[value='empty']").attr("selected", "selected");
  
  
  /*var myCars = new Array("Saab","Volvo","BMW");
  $('.typeahead').typeahead(myCars);*/
  search();
  $("#country").select2({ formatResult: format, formatSelection: format });
  $("#capital").select2();
  $("#city").select2();
});

function add_description_about_country(){
  $("#country").change(function(){
    country_id = $(this).find("option:selected").attr("id");
    $("#capital").find("option").first().attr('selected',"true");
    $("#city").find("option").first().attr('selected',"true");
    //.find("option").attr("value","empty");
    if (country_id != 0){
      $.ajax({ url: "/about_country",   type: "GET", data: {id: country_id}});
      
      setTimeout(function(){
        var zoom = parseInt($("#country_data").attr("data-zoom")),
            X_coordinat = $("#country_data").attr("data-coordinateX"),
            Y_coordinat = $("#country_data").attr("data-coordinateY"),
            name_country = $("#country_data").attr("data-name");            
            addMarker(new google.maps.LatLng(Y_coordinat, X_coordinat), name_country, zoom);
      }, 1000);          
    }
    if (country_id == 0){
      $("#description").text("");
      $("#info").remove();
    }

  });
}

function add_description_about_capital(){
  $("#capital").change(function(){
    capital_id = $(this).find("option:selected").attr("id");
    $("#country").find("option").first().attr('selected',"true");
    $("#city").find("option").first().attr('selected',"true");
    if (capital_id != 0){
      $.ajax({ url: "/about_capital",   type: "GET", data: {id: capital_id}});
      
      setTimeout(function(){

        var zoom = parseInt($("#capital_data").attr("data-zoom")),
            X_coordinat = $("#capital_data").attr("data-coordinateX"),
            Y_coordinat = $("#capital_data").attr("data-coordinateY"),
            name_capital = $("#capital_data").attr("data-name");                        
            addMarker(new google.maps.LatLng(Y_coordinat, X_coordinat), name_capital, zoom);
      }, 1000);      
    }
    if (capital_id == 0){
      $("#description").text("");
      $("#info").remove();
    }
  });
}

function add_description_about_city(){
  $("#city").change(function(){
    city_id = $(this).find("option:selected").attr("id");
    $("#country").find("option").first().attr('selected',"true");
    $("#capital").find("option").first().attr('selected',"true");
    if (city_id != 0){
      $.ajax({ url: "/about_city",   type: "GET", data: {id: city_id}});
      
      setTimeout(function(){

        var zoom = parseInt($("#city_data").attr("data-zoom")),
            X_coordinat = $("#city_data").attr("data-coordinateX"),
            Y_coordinat = $("#city_data").attr("data-coordinateY"),
            name_capital = $("#city_data").attr("data-name");                        
            addMarker(new google.maps.LatLng(Y_coordinat, X_coordinat), name_capital, zoom);
      }, 1000);      
    }
    if (city_id == 0){
      $("#description").text("");
      $("#info").remove();
    }
  });
}

function addMarker(location, title, zoom) {
  marker.setPosition(location); 
  marker.setMap(map); 
  marker.setTitle(title); 
  
  map.setCenter(location);
  map.setZoom(zoom);
}

function search(){
  $("#search").on('click', function(){
    var input_text = $("#information").val();
    if(input_text === ''){
      $("#search").after("<p id='text_atention'>Введіть текст для пошуку</p>");
      setTimeout(function(){
        $("#text_atention").remove();
      }, 5000);
    }else{      
      $("#text_atention").remove(); 
      $("#around_warning").remove();       
      
      /*var f = input_text.charAt(0).toUpperCase();
      var str = f + input_text.substr(1, input_text.length-1);*/
      var str = input_text.charAt(0).toUpperCase() + input_text.slice(1);            
      var result = $("#country").find("option[value='"+ str +"']");            
      if(result.length > 0){
        $("#country").find("option[value='empty']").attr("selected", "selected");
        $("#capital").find("option[value='empty']").attr("selected", "selected");   
        $("#city").find("option[value='empty']").attr("selected", "selected");   
      
        $("#country").find("option[value='"+ str +"']").attr("selected", "selected").trigger('change');
        add_description_about_country();      
      }
      else{
        var result_capital = $("#capital").find("option[value='"+ str +"']");
        //console.log(result_capital);
        if(result_capital.length > 0){
          $("#country").find("option[value='empty']").attr("selected", "selected");
          $("#capital").find("option[value='empty']").attr("selected", "selected");   
          $("#city").find("option[value='empty']").attr("selected", "selected");   
      
          $("#capital").find("option[value='"+ str +"']").attr("selected", "selected").trigger('change');
          add_description_about_capital();      
        }
        else{
          var result_city = $("#city").find("option[value='"+ str +"']");
          if(result_city.length > 0){
            $("#country").find("option[value='empty']").attr("selected", "selected");
            $("#capital").find("option[value='empty']").attr("selected", "selected");   
            $("#city").find("option[value='empty']").attr("selected", "selected");   

            $("#city").find("option[value='"+ str +"']").attr("selected", "selected").trigger('change');
            add_description_about_city();
          }
          else{
            $("#information").before("<div id='around_warning'><p id='text_warning'>Шукана Вами інформація відсутня</p></div>");
            setTimeout(function(){
              $("#around_warning").remove();
            }, 7000);
          }          
        }
      }      
      
      $("#information").attr('value',"");      
    }   
  });
}

function format(state){
  if (!state.id){
    return state.text;            
  }
  else{
    if(state.id === "Кот-д'Івуар"){
      return "<img class='flag' src='/assets/flags/africa/Кот-дІвуар.png'/>" + state.text;
    }
    else{
      return "<img class='flag' src='/assets/flags/africa/"+ state.id +".png'/>" + state.text;
    }    
  } 
  
}
