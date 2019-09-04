import mapboxgl from 'mapbox-gl';

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 200, maxZoom: 15, duration: 0 });
// };

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/klingmap/ck03g7jom03x21cnwljt98250',
    center: [7.856,51.083],
    zoom: 5.5,
  });
};


export const map = mapElement ? buildMap() : null;

const initMapbox = () => {

      if (mapElement) {
  // [ ... ]
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {

    const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('https://placekitten.com/g/50/50')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '25px';
  element.style.height = '25px';


    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
 }
}

// markers.forEach((marker) => {

//   const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

//   // Create a HTML element for your custom marker
//   const element = document.createElement('div');
//   element.className = 'marker';
//   element.style.backgroundImage = `url('${marker.image_url}')`;
//   element.style.backgroundSize = 'contain';
//   element.style.width = '25px';
//   element.style.height = '25px';

//   // Pass the element as an argument to the new marker
//   new mapboxgl.Marker(element)
//     .setLngLat([marker.lng, marker.lat])
//     .setPopup(popup)
//     .addTo(map);
// });
// if (mapElement) {
//   // [ ... ]
//   fitMapToMarkers(map, markers);
// }

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };



  //    const markers = JSON.parse(mapElement.dataset.markers);
  //   markers.forEach((marker) => {
  //     new mapboxgl.Marker()
  //       .setLngLat([ marker.lng, marker.lat ])
  //       .addLayer({
  //         id: 'historical-places',
  //         type: 'circle',
  //         source: {
  //           type: 'vector',
  //           url: 'mapbox://styles/mapbox/streets-v10'
  //         },
  //         'source-layer': 'place_label',
  //         paint: {
  //           'circle-radius': [
  //             '/',
  //             ['-', 2017, ['number', ['get', 'Constructi'], 2017]],
  //             10
  //           ],
  //           'circle-opacity': 0.8,
  //           'circle-color': 'rgb(171, 72, 33)'
  //         }
  //       })
  //       .addTo(map);
  //   });
  //   fitMapToMarkers(map, markers);
  // }


// };

export { initMapbox };
