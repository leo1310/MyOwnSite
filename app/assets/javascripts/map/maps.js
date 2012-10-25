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
  /*var zoom = parseInt($("#part_of_the_world_data").attr("data-zoom")),
      X_coordinat = $("#part_of_the_world_data").attr("data-coordinateX"),
      Y_coordinat = $("#part_of_the_world_data").attr("data-coordinateY"),
      name = $("#part_of_the_world_data").attr("data-name");                  
  initialize(Y_coordinat, X_coordinat, zoom, name);*/
  
  initialize(30.0443, 391.2358, 15, 'title');
  
  /*var myCars = new Array("Saab","Volvo","BMW");
  $('.typeahead').typeahead(myCars);*/

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
