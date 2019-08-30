import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 200, maxZoom: 15, duration: 0 });
};


const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [52.3667, 4.8945],
      zoom: 13
    });

     const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addLayer({
          id: 'historical-places',
          type: 'circle',
          source: {
            type: 'vector',
            url: 'mapbox://styles/mapbox/streets-v1'
          },
          'source-layer': 'your-source-layer-here',
          paint: {
            'circle-radius': [
              '/',
              ['-', 2017, ['number', ['get', 'Constructi'], 2017]],
              10
            ],
            'circle-opacity': 0.8,
            'circle-color': 'rgb(171, 72, 33)'
          }
        })
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };