// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function initMap(title, lat, lng, address, city, state, zip) {
    var coords = new google.maps.LatLng(lat, lng);
    var google_adr = address + ', ' + city + ', ' + state + ' ' + zip
    var encoded_adr = encodeURIComponent(google_adr);
    var contentString =
      '<h5>' + title + '</h5>' +
      '<p>' + address + ', ' + city + ', ' + state + ' ' + zip + '</p>' +
      '<a href="https://www.google.com/maps/dir/?api=1&destination=' + encoded_adr + '" target="_blank" rel="noopener" style="cursor: pointer; color: rgb(66, 127, 237); text-decoration: none;">Directions</a></div>';
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });

    var mapOptions = {
    center: coords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var marker = new google.maps.Marker({
        position: coords,
        map: map,
        title: title
    });
    marker.addListener('click', function() {
      infowindow.open(map, marker);
    });
}
