import mapboxgl from 'mapbox-gl';
import { map } from '../plugins/init_mapbox';


const addRhineLineToMap = () => {

const geojson = require('./map_layers_data/rhine_line.json')

map.on('load', function () {


  map.addSource('rhine_line', {
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
      "id": "rhine_line",
        "type": "line",
        "source": "rhine_line",
        'paint': {
          'line-color': '#EDF5FB',
          'line-width': 1,
          }
  }, firstSymbolId);



    map.on('click', 'rhine_line', function (e) {
    new mapboxgl.Popup()
        .setLngLat(e.lngLat)
        // .setHTML(e.features[0].properties.naamnl)
        .addTo(map);
    });
});



};

export { addRhineLineToMap };

