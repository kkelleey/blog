$(document).ready(function() {
  var bittersMap = (function () {
    var configData = $('#map-canvas-container').data();
      var mapCenter = new google
        .maps
        .LatLng(configData.latitude, configData.longitude),
        mapCanvas = document.getElementById('map_canvas'),
        mapOptions = {
          center: mapCenter,
          zoom: configData.zoom,
          scrollwheel: true,
          draggable: true,
          disableDefaultUI: true,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        },
        map = new google.maps.Map(mapCanvas, mapOptions),
        url = $('#map_canvas').data('src');
        $.getJSON(url, function(cities) {
          $.each(cities, function(index, city) {
            var marker = new google.maps.Marker({
              position: { lat: city.lat, lng: city.longitude },
              map: map,
              title: city.name,
              // label: (index + 1).toString(),
            });
            if (city.postUrl) {
              var postsLink = '<a href="' + city.postUrl + '">See post(s)</a>';
            } else {
              var postsLink = '<p>There are no posts for ' + city.name + '</p>';
            }
            var infowindow = new google.maps.InfoWindow({
              content: '<h1>' + city.name + '</h1>' + postsLink,
              maxWidth: 300,
            })
            google.maps.event.addListener(marker, 'click', function () {
              infowindow.open(map,marker);
            });
          });
        });
    return {
      init: function () {
        map.set('styles', [{
          featureType: 'landscape',
          elementType: 'geometry',
          stylers: [
            { hue: '#ffff00' },
            { saturation: 30 },
            { lightness: 10}
          ]}
        ]);

      }
    };
  }());

  bittersMap.init();
});

