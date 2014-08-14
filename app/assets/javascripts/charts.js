$(document).on('page:laod ready', function(){
  //Course curve chart

  var courses = $('.course-chart');
  var course;
  for (var i=0; i < courses.length; i++){
    course = courses[i]
    var studentPoints = JSON.parse(course.dataset.studentPoints)
    console.log(studentPoints)
    var chart = new AmCharts.AmXYChart();
    chart.marginRight = 0;
    chart.marginTop = 0;
    chart.dataProvider = []
    chart.autoMarginOffset = 0;

    // X Axis
    var xAxis = new AmCharts.ValueAxis();
    xAxis.position = "bottom";
    xAxis.axisAlpha = 0;
    xAxis.maximum = studentPoints.length;
    chart.addValueAxis(xAxis);

    // Y Axis
    var yAxis = new AmCharts.ValueAxis();
    yAxis.position = "left";
    yAxis.axisAlpha = 0;
    yAxis.maximum = JSON.parse(course.dataset.possiblePoints);
    chart.addValueAxis(yAxis);

    // Graph
    var graph = new AmCharts.AmGraph();
    graph.yfield = "vaue1";
    graph.xfield = "x";
    chart.addGraph(graph)

    // Call function to populate chart
    generateData(studentPoints);

    //Write
    chart.write("chart" + i)

  }

  function generateData(studentPoints){
    console.log("called")
    var dataProvider = [];
    for (var i=0; i < studentPoints.length; i++){
    dataProvider.push({x:i, value1: studentPoints[i]})
    }
    chart.dataProvider = dataProvider;
    chart.validateData();
  };
})