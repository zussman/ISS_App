<script type="text/javascript">
function moveISS () {
    $.getJSON('http://api.open-notify.org/iss-now.json?callback=?', function(data) {
        var lat = data['iss_position']['latitude'];
        var lon = data['iss_position']['longitude'];

        // See leaflet docs for setting up icons and map layers
        // The update to the map is done here:
        iss.setLatLng([lat, lon]);
        isscirc.setLatLng([lat, lon]);
        map.panTo([lat, lon], animate=true);
    });
    setTimeout(moveISS, 1000); 
}


var map = handler = Gmaps.build('Google');
var latitude = <%= @latitude || 0 %>;
var longitude = <%= @longitude || 0 %>;
handler.buildMap({
  internal: {id: 'map'},
  provider: {
      zoom: 3,
      center: new google.maps.LatLng(latitude, longitude),
      styles: mapStyle
    }
  }, 
  function(){
  markers = handler.addMarkers([
    {
      "lat": latitude,
      "lng": longitude,
      /*"picture": {
        "url": "http://icon.softwaresea.com/32x32/5/394/1196603.891ea57c45143d46f175d87e8951cfb8.gif",
        "width":  36,
        "height": 36,
      },*/
      "infowindow": "hello!"
    },
  ]);
});
nite.init(map);
</script>