$(document).ready( function (){
  getTitle('.country_capcha');
  getTitle('.country_capcha_right');  
  selectCity();
  $(".description").hide();
  $(".something").show();    
});

function getTitle(ul_class){
  $(''+ ul_class).find('li').find('a').on('click', function(){
    var title = $(this).text();
    $('#center > h2').text(title);
    if(title === "Title_Left_1"){
    	$(".description").hide();
    	$(".description_about_city").hide();
    	$("#city").find("option").first().attr('selected',"true");
    	$(".country_info").show();        	
    }
  });
}
function selectCity()
{
  $("#city").change(function(){
	var title = $(this).find("option:selected").val();
	var city_id = $(this).find("option:selected").attr("id");
	if(title != 'empty'){
		$('#center > h2').text(title);
	}	
	if (city_id != 0){
		$.ajax({ url: "/world_cities",   type: "GET", data: {id: city_id}});
	}
  });
}

/*$("#country").change(function(){
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

  });*/