import mapboxgl from 'mapbox-gl';
import { map } from '../plugins/init_mapbox';


const addAreaLabelsToMap = () => {

const geojson = require('./map_layers_data/label_points.json')

map.on('load', function () {

  // console.log(geojson)

  map.addSource('area_labels', {
    "type": "geojson",
    "data": geojson
  });


  map.addLayer({
      "id": "barea_labels",
      "type": "symbol",
      "source": "area_labels",
      'paint': {
        'text-color': '#F7DB64'
      },
      "layout": {
        "text-field": ["get", "name"]
        }
  })


    // map.on('click', 'benelux', function (e) {
    // new mapboxgl.Popup()
    //     .setLngLat(e.lngLat)
    //     // .setHTML(e.features[0].properties.naamnl)
    //     .addTo(map);
    // });
});



};

export { addAreaLabelsToMap };
