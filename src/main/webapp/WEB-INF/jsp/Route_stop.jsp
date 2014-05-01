<html>
<body onload="initialize()" style="font-family: sans-serif;">
  <table style="width: 400px">

    <tr>
      <td><input type="button" value="Reset" onclick="reset()" /></td>
    </tr>
    <tr>
      <td><input type="button" value="Get Directions!" onclick="calcRoute()" /></td>
      <td></td>
    </tr>
  </table>
  <div style="position:relative; border: 1px; width: 610px; height: 400px;">
    <div id="map_canvas" style="border: 1px solid black; position:absolute; width:1000px; height:500px"></div>
    <div id="directionsPanel" style="position:absolute; left: 1000px; width:300px; height:400px; overflow: auto"></div>

  </div>
</body>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
  var directionDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;
  var origin = null;
  var destination = null;
  var waypoints = [];
  var markers = [];
  var directionsVisible = false;
var count=0;
  function initialize() {

    directionsDisplay = new google.maps.DirectionsRenderer();
    var deemsys = new google.maps.LatLng(12.9052813,80.20354629999997);
    var myOptions = {
      zoom:14,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: deemsys
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directionsPanel"));

    google.maps.event.addListener(map, 'click', function(event) {
      if (origin == null) {
        origin = event.latLng;
        addMarker(origin);
      }

 else if (destination == null) 
	{
        destination = event.latLng;
        addMarker(destination);
        } 
else {
        if (waypoints.length < 9) 
	{
          waypoints.push({ location: destination, stopover: true });
          destination = event.latLng;
          addMarker(destination);
        } 
	else 
	{
          alert("Maximum number of waypoints reached");
        }
     }
    });
  }

  function addMarker(latlng) {

    markers.push(new google.maps.Marker({
      position: latlng, 
      map: map,
      draggable:true,
      icon:"http://maps.google.com/mapfiles/marker" + String.fromCharCode(markers.length+65) +".png"
    }));    
 
}




  function calcRoute() {

    if (origin == null) {
      alert("Click on the map to add a start point");
      return;
    }

    if (destination == null) {
      alert("Click on the map to add an end point");
      return;
    }

    var mode = google.maps.DirectionsTravelMode.DRIVING;

    var request = {
        origin: origin,
        destination: destination,
        waypoints: waypoints,
        travelMode: mode,

    };

    directionsService.route(request, function(response, status) 
    {
   if (status == google.maps.DirectionsStatus.OK) {
    directionsDisplay.setDirections(response);
    }
    });

    clearMarkers();
    directionsVisible = true;
  }

  function clearMarkers() {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
  }

  function clearWaypoints() {
    markers = [];
    origin = null;
    destination = null;
    waypoints = [];
    directionsVisible = false;
  }

  function reset() {
    clearMarkers();
    clearWaypoints();
    directionsDisplay.setMap(null);
    directionsDisplay.setPanel(null);
    directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directionsPanel"));    
  }
</script>
</html>