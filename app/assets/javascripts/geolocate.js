var getCoordinates = function() {
  $('.container').on('click', '#checkTemp', function(){
    var hotCold = $("#hotCold");
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            hotCold.empty(); 
            hotCold.append("Geolocation is not supported by this browser.");
        }
    }

    function getProximity(lat1,lon1,lat2,lon2) {
      var R = 6371; // Radius of the earth in km
      var dLat = deg2rad(lat2-lat1);  
      var dLon = deg2rad(lon2-lon1); 
      var a = 
        Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
        Math.sin(dLon/2) * Math.sin(dLon/2)
        ; 
      var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
      var d = R * c; // Distance in km
      return d;
    }

    function deg2rad(deg) {
      return deg * (Math.PI/180)
    }

    function showPosition(position) {
      var distance = getProximity(position.coords.latitude, 
                                  position.coords.longitude, 
                                  destinationLat, 
                                  destinationLon);

      var distanceBrackets = {.3: " Cold as ice", .025: " You're getting warm!"};

      for(var key in distanceBrackets){
        if (distance >= key) {
          var temperature = distanceBrackets[key];
          break;
        } else {
          var temperature = " You're smokin'!"; 
        }
      };
      hotCold.append(temperature); 
    }
    getLocation();
  });
};

$(document).ready(getCoordinates);
$(document).on('page:load', getCoordinates);