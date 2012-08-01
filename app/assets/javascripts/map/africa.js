function initialize() {
        var myOptions = {
          center: new google.maps.LatLng(5.000, 390.000),
          zoom: 4,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);

        var marker = new google.maps.Marker({
            position: map.getCenter(),
            map: map,
            title: 'Click to zoom'
        });        
      }          

google.maps.event.addDomListener(window, 'load', initialize);