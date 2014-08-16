$(document).on('page:laod ready', function(){
  //Course curve chart

  var courses = $('.course-chart');
  var course;
  AmCharts.ready(function(){
    for (var i=0; i < courses.length; i++){
      course = courses[i]
      var studentPoints = JSON.parse(course.dataset.studentPoints)
      console.log(studentPoints)
      var chart = new AmCharts.AmXYChart();
      chart.autoMargins = true
      chart.dataProvider = []
      chart.autoMarginOffset = 0;

      // X Axis
      var xAxis = new AmCharts.ValueAxis();
      xAxis.position = "bottom";
      xAxis.maximum = studentPoints.length;
      chart.addValueAxis(xAxis);

      // Y Axis
      var yAxis = new AmCharts.ValueAxis();
      yAxis.position = "left";
      yAxis.maximum = JSON.parse(course.dataset.possiblePoints);
      yAxis.autoGridCount = true;
      chart.addValueAxis(yAxis);

      // Graph
      var graph = new AmCharts.AmGraph();
      graph.yField = "value1";
      graph.xField = "x";
      graph.lineAlpha = 0;
      chart.addGraph(graph)

      // Call function to populate chart
      generateData(studentPoints, chart);

      //Write
      chart.write("chart" + i)

    }

    function generateData(studentPoints, chart){
      console.log("called")
      var dataProvider = [];
      for (var i=0; i < studentPoints.length; i++){
      dataProvider.push({x:i, value1: studentPoints[i]})
      }
      chart.dataProvider = dataProvider;
      chart.validateNow();
    };
  });
})