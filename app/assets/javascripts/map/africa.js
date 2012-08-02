function initialize(Y_coordinat, X_coordinat, zoom, title) {
        var myOptions = {
          center: new google.maps.LatLng(Y_coordinat, X_coordinat),
          zoom: zoom,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);

        var marker = new google.maps.Marker({
            position: map.getCenter(),
            map: map,
            title: title
        });        
      }          

$(document).ready( function (){
  add_description_africa_country();  
  add_description_africa_capital();
  initialize(5.000, 390.000, 4, 'Африка');

  
});

function add_description_africa_country(){
  $("#country").change(function(){
    country_id = $(this).find("option:selected").attr("id");
    if (country_id != 0){
      $.ajax({ url: "/africa_country",   type: "GET", data: {id: country_id}});
      
      setTimeout(function(){
        var zoom = parseInt($("#capital_data").attr("data-zoom")),
            X_coordinat = $("#capital_data").attr("data-coordinateX"),
            Y_coordinat = $("#capital_data").attr("data-coordinateY"),
            name_capital = $("#capital_data").attr("data-name");            
            initialize(Y_coordinat, X_coordinat, zoom, name_capital)
      }, 1000);
          
    }
    if (country_id == 0){
      $("#description").text("");
    }

  });
}

function add_description_africa_capital(){
  $("#capital").change(function(){
    capital_id = $(this).find("option:selected").attr("id");
    if (capital_id != 0){
      $.ajax({ url: "/africa_capital",   type: "GET", data: {id: capital_id}});
      
      setTimeout(function(){
        var zoom = parseInt($("#capital_data").attr("data-zoom")),
            X_coordinat = $("#capital_data").attr("data-coordinateX"),
            Y_coordinat = $("#capital_data").attr("data-coordinateY"),
            name_capital = $("#capital_data").attr("data-name");            
            initialize(Y_coordinat, X_coordinat, zoom, name_capital)
      }, 1000);
      
    }
    if (capital_id == 0){
      $("#description").text("");
    }
  });
}
