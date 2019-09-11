// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var map, infoWindow;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14
  });
  infoWindow = new google.maps.InfoWindow;

  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      user_location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      map.setCenter(user_location);
    }, deniedGeolocation);
   }
  function deniedGeolocation() {
    user_location = new google.maps.LatLng(lat, lng);
    map.setCenter(user_location);
  }
  for( i = 0; i < markers.length; i++) {
    var position = new google.maps.LatLng(markers[i][1], markers[i][2])
    marker = new google.maps.Marker({
      position: position,
      map: map,
      title: markers[i][0]
    });
    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function () {
        infoWindow.setContent(markers[i][0])
        infoWindow.open(map, marker);
      }
    })(marker, i));
  }
}
