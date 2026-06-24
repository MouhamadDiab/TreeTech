<!DOCTYPE html>
<html>
<head>
    <title>Select Location on Map</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <style>
        #map { height: 400px; width: 100%; }
    </style>
</head>
<body>

<h3>Click anywhere on the map to choose your location:</h3>
<div id="map"></div>
<button onclick="confirmLocation()">OK</button>

<script>
    var map = L.map('map').setView([33.8938, 35.5018], 7);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19
    }).addTo(map);

    var marker;
    var selectedLatLng = null;

    map.on('click', function(e) {
        selectedLatLng = e.latlng;
        if (marker) {
            marker.setLatLng(e.latlng);
        } else {
            marker = L.marker(e.latlng).addTo(map);
        }
    });

    function confirmLocation() {
        if (selectedLatLng) {
            // Redirect with GET parameters to PHP page
            window.location.href = "cart.php?lat=" + selectedLatLng.lat.toFixed(5) + "&lng=" + selectedLatLng.lng.toFixed(5);
        } else {
            alert("Please select a location on the map first.");
        }
    }
</script>

</body>
</html>
