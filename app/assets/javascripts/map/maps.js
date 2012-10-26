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
  add_description_africa_country();  
  add_description_africa_capital();
  var zoom = parseInt($("#part_of_the_world_data").attr("data-zoom")),
      X_coordinat = $("#part_of_the_world_data").attr("data-coordinateX"),
      Y_coordinat = $("#part_of_the_world_data").attr("data-coordinateY"),
      name = $("#part_of_the_world_data").attr("data-name");                  
  initialize(Y_coordinat, X_coordinat, zoom, name);
  
  $("#country").find("option[value='empty']").attr("selected", "selected");
  $("#capital").find("option[value='empty']").attr("selected", "selected");
  //initialize(4.845, 391.600, 8, 'title');
  
  /*var myCars = new Array("Saab","Volvo","BMW");
  $('.typeahead').typeahead(myCars);*/
  search();  
});

function add_description_africa_country(){
  $("#country").change(function(){
    country_id = $(this).find("option:selected").attr("id");
    $("#capital").find("option").first().attr('selected',"true");
    //.find("option").attr("value","empty");
    if (country_id != 0){
      $.ajax({ url: "/world_countries",   type: "GET", data: {id: country_id}});
      
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

function add_description_africa_capital(){
  $("#capital").change(function(){
    capital_id = $(this).find("option:selected").attr("id");
    $("#country").find("option").first().attr('selected',"true");
    if (capital_id != 0){
      $.ajax({ url: "/world_capitals",   type: "GET", data: {id: capital_id}});
      
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
      $.ajax({ url: "/search_content",   type: "GET", data: {input_text: input_text}});
      $("#information").attr('value',"");      
    }   
  });
}
