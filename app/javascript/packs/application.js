import "bootstrap";
require("chartkick")
require("chart.js")

  var ctx = document.getElementById('chart1').getContext('2d');
  var chart1 = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
      labels: ['', '9/9/19', '10/9/19', '11/9/19', '12/9/19', '13/9/19', '14/9/19', '15/9/19'],
      datasets: [{
        label: 'Waterlevels - Kaub',
        // backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgba(78, 132, 131, 1)',
        data: [160, 210, 198, 195, 180, 175, 190, 198]
      }]
    },

    // Configuration options go here
    options: {
    legend: {
            display: true,
            position: 'bottom',
            labels: {
                fontColor: 'rgba(78, 132, 131, 1)'
            }
        }

    }
  });


var ctx = document.getElementById('chart2').getContext('2d');
var chart2 = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Adam - Rdam', 'Adam - Antw', 'Adam - Adam', 'Rdam - Antw', 'Rdam - Flush', 'Antw - Flush'],
        datasets: [{
            label: 'Freight rates ARA',
            data: [6.50, 7.50, 4.25, 6, 5.75, 4.5],
            backgroundColor: [
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
            ],
            borderColor: [
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
                'rgba(78, 132, 131, 1)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
                //  xAxes: [{
                //     barPercentage: 0.7
                // }]
            }]
        }
    }
});

  var ctx = document.getElementById('chart3').getContext('2d');
  var chart3 = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
      labels: ['', '9/9/19', '10/9/19', '11/9/19', '12/9/19', '13/9/19', '14/9/19', '15/9/19'],
      datasets: [{
        label: 'Gasoilrates - ARA',
        lineTension: 0,
        // backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgba(78, 132, 131, 1)',
        data: [62, 65, 70, 64, 62, 60, 58, 61]
      }]
    },

    // Configuration options go here
    options: {
         legend: {
            display: true,
            position: 'bottom',
            labels: {
                fontColor: 'rgba(78, 132, 131, 1)',
                fill: false
            }
        }
    }
  });



chart1.render();
chart2.render();
chart3.render();
