// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var map, infoWindow;
var markers = [];
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
  for( i = 0; i < restaurants.length; i++) {
    var position = new google.maps.LatLng(restaurants[i][1], restaurants[i][2])
    marker = new google.maps.Marker({
      position: position,
      map: map,
      title: restaurants[i][0]
    });
    let address = encodeURIComponent(restaurants[i][3]);
    let contentString =
      '<h5><a href=' + restaurants[i][4] + '>' + restaurants[i][0] + '</a></h5>' +
      '<p>' + restaurants[i][3] + '</p>' +
      '<a href="https://www.google.com/maps/dir/?api=1&destination=' + address + '" target="_blank" rel="noopener" style="cursor: pointer; color: rgb(66, 127, 237); text-decoration: none;">Directions</a></div>';
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function () {
        infoWindow.setContent(contentString)
        infoWindow.open(map, marker);
      }
    })(marker, i));
    markers.push(marker);
  }
}

function showMarker(id) {
  google.maps.event.trigger(markers[id], 'click');
}
