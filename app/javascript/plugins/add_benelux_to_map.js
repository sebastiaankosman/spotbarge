import mapboxgl from 'mapbox-gl';
import { map } from '../plugins/init_mapbox';


const addBeneluxToMap = () => {

const geojson = require('./map_layers_data/benelux.json')

map.on('load', function () {

  // console.log(geojson)

  map.addSource('benelux', {
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
      "id": "benelux",
        "type": "fill",
        "source": "benelux",
        'paint': {
          'fill-color': '#F7DB64',
          'fill-opacity': 0.17,
          'fill-outline-color': 'rgba(255,255,255, 1)',
          }
  }, firstSymbolId);

  map.addLayer({
      "id": "benelux_line",
        "type": "line",
        "source": "benelux",
        'paint': {
          'line-color': '#F7DB64',
          'line-width': 0.5,
          }
  }, firstSymbolId);



    map.on('click', 'benelux', function (e) {
    new mapboxgl.Popup()
        .setLngLat(e.lngLat)
        // .setHTML(e.features[0].properties.naamnl)
        .addTo(map);
    });
});



};

export { addBeneluxToMap };



// ARA
// Rhine
// Middle-Rhine
// Upper-Rhine

