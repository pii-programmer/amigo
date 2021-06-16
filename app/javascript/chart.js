function chart(){

  const data = {
    labels: ["amigo"],
    datasets: [{
      axis: 'y',
      label: 'アミーゴ指標',
      data: [61],
      fill: false,
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)'
      ],
      borderColor: [
        'rgb(255, 99, 132)'
      ],
      borderWidth: 1
    }]
  };

  const config = {
    type: 'bar',
    data,
    options: {
      indexAxis: 'y',
    }
  };

  let amigoGraph = new Chart(
    document.getElementById('amigograph'),
    config
  );

  $('#button').on('click', function(){
    amigoGraph.config.data.datasets[0].data[0] += 1;
    amigoGraph.update();
  });

};
window.addEventListener('load', chart);