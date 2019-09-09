// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var map, infoWindow;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14
  });
  infoWindow = new google.maps.InfoWindow;

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: Geolocation failed.' :
                        'Error: Your browser does not support geolocation.');
  infoWindow.open(map);
}
