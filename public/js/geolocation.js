var x = document.getElementById("geoError");

function geoFindMe() {
    if (!navigator.geolocation){
      x.innerHTML = "<p>Geolocation is not supported by your browser</p>";
      return;
    }
  
    function success(position) {
      var latitude  = position.coords.latitude;
      var longitude = position.coords.longitude;

     var GEOCODING = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + latitude + '%2C' + longitude + '&language=en';

     $.getJSON(GEOCODING).done(function(location) {
        for (var i = 0; i < location.results[0].address_components.length; i++) {
          if (location.results[0].address_components[i].types[0] == "country") {
            $('#country').val(location.results[0].address_components[i].long_name);
          }
          if (location.results[0].address_components[i].types[0] == "locality") {
            $('#city').val(location.results[0].address_components[i].long_name);
          }
      }
     })

    };
  
    function error() {
      x.innerHTML = "Unable to retrieve your location";
    }
  
    navigator.geolocation.getCurrentPosition(success, error);

}