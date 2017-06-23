<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 9
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            //infoWindow.setPosition(pos);
            //infoWindow.setContent('Your location.');
            //infoWindow.open(map);
            map.setCenter(pos);
            var marker = new google.maps.Marker({
                position: pos,
                title:"Your Location."
            });
            marker.setMap(map);
            
            var request = {
                    location: pos,
                    radius: 50000,
                    types: ['cafe','restaurant','night-club','bar']
                }
                infowindow = new google.maps.InfoWindow();
                service = new google.maps.places.PlacesService(map);
                service.nearbySearch(request, callback);
            
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });

         
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
        
        	}

        	function callback(results, status) {
                if (status === google.maps.places.PlacesServiceStatus.OK) {
                    results.forEach(createMarker);
                  }
        	}
        

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
      
      function createMarker(place) {
          var placeLoc = place.geometry.location;
          var marker = new google.maps.Marker({
              map: map,
              position: place.geometry.location
          });
          marker.addListener('click', function() {

            var request = {
                reference: place.reference
            };
            service.getDetails(request, function(details, status) {

              infowindow.setContent([
                details.name,
                details.formatted_address,
                details.website,
                details.rating,
                details.formatted_phone_number].join("<br />"));
              infowindow.open(map, marker);
            });

          })
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqaqR7bG_U5tKn_wFvScFv6y17S6aXjNQ&libraries=places&callback=initMap">
    </script>
  </body>
</html>