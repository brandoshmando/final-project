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

      //Define X Axis (Category Field)
      chart.categoryField = 'x'
      // Graph
      var graph = new AmCharts.AmGraph();
      graph.valueField = "y";
      graph.type = "smoothedLine";
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
      dataProvider.push({x:i, y:studentPoints[i] })
      }
      console.log(dataProvider)
      chart.dataProvider = dataProvider;
      chart.validateNow();
    };
  });
})