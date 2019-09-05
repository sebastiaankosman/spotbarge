import mapboxgl from 'mapbox-gl';
import { map } from '../plugins/init_mapbox';


const addNorthgermanyToMap = () => {

const geojson = require('./map_layers_data/north_germany.json')

map.on('load', function () {

  // console.log(geojson)

  map.addSource('north_germany', {
    "type": "geojson",
    "data": geojson
  });


  const layers = map.getStyle().layers;
  // Find the index of the first symbol layer in the map style
  let firstSymbolId;
  for (let i = 0; i < layers.length; i++) {
      if (layers[i].type === 'symbol') {
          firstSymbolId = layers[i].id;
          break;
      }
  }

  map.addLayer({
      "id": "north_germany",
        "type": "fill",
        "source": "north_germany",
        'paint': {
          'fill-color': '#F7DB64',
          'fill-opacity': 0.17,
          'fill-outline-color': 'rgba(255,255,255, 1)',
          }
  }, firstSymbolId);

  map.addLayer({
      "id": "north_germany_line",
        "type": "line",
        "source": "north_germany",
        'paint': {
          'line-color': '#F7DB64',
          'line-width': 0.5,
          }
  }, firstSymbolId);




    map.on('click', 'north_germany', function (e) {
    new mapboxgl.Popup()
        .setLngLat(e.lngLat)
        // .setHTML(e.features[0].properties.naamnl)
        .addTo(map);
    });
});



};

export { addNorthgermanyToMap };
