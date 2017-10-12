var x = document.getElementById("geoError");

function geoFindMe() {
    if (!navigator.geolocation){
      x.innerHTML = "<p>Geolocation is not supported by your browser</p>";
      return;
    }
  
    function success(position) {
      var latitude  = position.coords.latitude;
      var longitude = position.coords.longitude;

     /*  var latlngJs[] = http://maps.googleapis.com/maps/api/geocode/json?latlng=latitude,longitude; */
     var GEOCODING = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + latitude + '%2C' + longitude + '&language=en';
     
     $.getJSON(GEOCODING).done(function(location) {
        console.log(location.results[0].address_components[1].long_name)
        $('#country').val(location.results[0].address_components[4].long_name);
        $('#city').val(location.results[0].address_components[1].long_name);
     })

    };
  
    function error() {
      x.innerHTML = "Unable to retrieve your location";
    }
  
    navigator.geolocation.getCurrentPosition(success, error);

}