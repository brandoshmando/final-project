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

      // Y Axis
      var yAxis = new AmCharts.ValueAxis();
      yAxis.position = "left";
      yAxis.maximum = studentPoints.length;
      chart.addValueAxis(yAxis);

      // X Axis
      var xAxis = new AmCharts.ValueAxis();
      xAxis.position = "bottom";
      xAxis.maximum = JSON.parse(course.dataset.possiblePoints);
      xAxis.autoGridCount = true;
      chart.addValueAxis(xAxis);

      // Graph
      var graph = new AmCharts.AmGraph();
      graph.yField = "value1";
      graph.xField = "x";
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
      dataProvider.push({x:studentPoints[i], value1:i })
      }
      console.log(dataProvider)
      chart.dataProvider = dataProvider;
      chart.validateNow();
    };
  });
})