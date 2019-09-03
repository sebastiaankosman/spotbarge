import mapboxgl from 'mapbox-gl';
import { map } from '../plugins/init_mapbox';


const addMiddleRhineToMap = () => {

const geojson = require('./map_layers_data/middle_rhine.json')

map.on('load', function () {

  // console.log(geojson)

  map.addSource('middle_rhine', {
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
      "id": "middle_rhine",
        "type": "fill",
        "source": "middle_rhine",
        'paint': {
          'fill-color': '#F7DB64',
          'fill-opacity': 0.3,
          'fill-outline-color': 'rgba(255,255,255, 1)',
          }
  }, firstSymbolId);

    map.addLayer({
      "id": "middle_rhine_line",
        "type": "line",
        "source": "middle_rhine",
        'paint': {
          'line-color': '#F7DB64',
          'line-width': 0.5,
          }
  }, firstSymbolId);




    map.on('click', 'middle_rhine', function (e) {
    new mapboxgl.Popup()
        .setLngLat(e.lngLat)
        // .setHTML(e.features[0].properties.naamnl)
        .addTo(map);
    });
});



};

export { addMiddleRhineToMap };




