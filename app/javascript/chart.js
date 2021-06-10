function chart(){
  const data = {
    labels: ["amigo"],
    datasets: [{
      axis: 'y',
      label: 'アミーゴ指標',
      data: [85],
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

  var amigoGraph = new Chart(
    document.getElementById('amigograph'),
    config
  );

};
window.addEventListener('load', chart);