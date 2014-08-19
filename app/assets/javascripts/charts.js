$(document).on('page:laod ready', function(){
  //Course curve chart

  var courses = $('.course-chart');
  var course;
  AmCharts.ready(function(){
    for (var i=0; i < courses.length; i++){
      course = courses[i]
      var studentPoints = JSON.parse(course.dataset.studentPoints)
      console.log(studentPoints)
      var chart = new AmCharts.AmSerialChart();
      chart.autoMargins = true
      chart.dataProvider = []
      chart.autoMarginOffset = 0;
      chart.theme = "none"
      chart.handdrawn = true;
      chart.handdrawnScatter = 3;

      //Define X Axis (Category Field)
      chart.categoryField = 'x'

      //Define Category Axis attributes
      chart.categoryAxis.minorGridEnabled = true;
      chart.categoryAxis.minorGridAlpha = 0.1;

      // Graph
      var graph = new AmCharts.AmGraph();
      graph.valueField = "y";
      graph.type = "column";
      graph.fillAlphas = 0.8;
      graph.lineAlpha = 0.2;
      graph.balloonColor = '#2ED959'
      graph.fillColors = '#2ED959'
      chart.addGraph(graph)

      // Call function to populate chart
      generateData(studentPoints, chart);

      //Chart Styling
      chart.gridAboveGraphs = true;
      chart.startDuration = 1;
      chart.categoryAxis.gridAlpha = 0

      //Add Chart cursor
      var chartCursor = new AmCharts.ChartCursor();
      chartCursor.zoomable = false;
      chartCursor.alpha = 0.9;
      chartCursor.cursorColor = '#28384B'
      chartCursor.chartBalloonEnabled = false;
      chart.addChartCursor(chartCursor);

      //Write
      chart.write("chart" + i)

    }

    function generateData(studentPoints, chart){
      console.log("called")
      var dataProvider = [];
      for (var i=0; i < studentPoints.length; i++){
      dataProvider.push({x:i + 1, y:studentPoints[i] })
      }
      console.log(dataProvider)
      chart.dataProvider = dataProvider;
      chart.validateNow();
    };
  });
})