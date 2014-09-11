// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require cocoon
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree .


$(document).on('page:load ready', function(){
  if ($('.course-chart').length > 0){
    AmCharts.ready(function(){
      generateChart(0);
    });
  };


  function generateChart(index) {
    var courses = $('.course-chart');
    var course;
    // AmCharts.ready(function(){

      course = courses[index]
      var studentPoints = JSON.parse(course.dataset.studentPoints)
      // console.log(studentPoints)
      var chart = new AmCharts.AmSerialChart();
      chart.autoMargins = true
      chart.dataProvider = []
      chart.autoMarginOffset = 0;
      chart.theme = "none"


      //Define X Axis (Category Field)
      chart.categoryField = 'x'

      //Define Category Axis attributes
      chart.categoryAxis.minorGridEnabled = true;
      chart.categoryAxis.minorGridAlpha = 0.1;
      chart.categoryAxis.axisColor = '#28384B'

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
      chart.categoryAxis.gridAlpha = 0;
      chart.categoryAxis.title = "Percentile";

      //Add Chart cursor
      var chartCursor = new AmCharts.ChartCursor();
      chartCursor.zoomable = false;
      chartCursor.alpha = 0.9;
      chartCursor.cursorColor = '#28384B'
      chartCursor.categoryBalloonEnabled = false;
      chart.addChartCursor(chartCursor);

      //Write
      chart.write("chart" + index)



      function generateData(studentPoints){
        // console.log("called")
        var dataProvider = [];
        for (var i=0; i < studentPoints.length; i++){
        dataProvider.push({x:((i + 1) * 10) + "th", y:studentPoints[i] })
        }
        // console.log(dataProvider)
        chart.dataProvider = dataProvider;
        chart.validateNow();
      };
    // });
  };
  // All logic for grade form starts here
  $('input[type=checkbox]').hide();

  //   $('label').on('click', function(){
  //   if ($(this).prev().is(':checked')){
  //     $(this).css({border:"1px solid black"});
  //   };
  // });
  // $('label').on('click', function(){
  //   $(this).css({border:"1px solid black"}), function(){
  //     $(this).css({border:"none"})
  //   };
  // });

  $('.comments').hide();
  $('.categories').on('click', function(){
    $(this).next().toggle('fold');
  });

  $(".js-vertical-tab-content").hide();
  $(".js-vertical-tab-content:first").show();

  /* if in tab mode */

  $(".js-vertical-tab").click(function(event) {
    event.preventDefault();
    var index = $(this).data('index')


    $(".js-vertical-tab-content").hide();
    var activeTab = $(this).attr("rel");
    $("#"+activeTab).show();

    $(".js-vertical-tab").removeClass("is-active");
    $(this).addClass("is-active");

    $(".js-vertical-tab-accordion-heading").removeClass("is-active");
    $(".js-vertical-tab-accordion-heading[rel^='"+activeTab+"']").addClass("is-active");
    generateChart(index);
  });

  /* if in accordion mode */

  $(".js-vertical-tab-accordion-heading").click(function(event) {
    event.preventDefault();

    $(".js-vertical-tab-content").hide();
    var accordion_activeTab = $(this).attr("rel");
    $("#"+accordion_activeTab).show();

    $(".js-vertical-tab-accordion-heading").removeClass("is-active");
    $(this).addClass("is-active");

    $(".js-vertical-tab").removeClass("is-active");
    $(".js-vertical-tab[rel^='"+accordion_activeTab+"']").addClass("is-active");
  });

   $('.accordion-tabs').each(function(index) {
    $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show();
  });

  $('.accordion-tabs').on('click', 'li > a', function(event) {
    if (!$(this).hasClass('is-active')) {
      event.preventDefault();
      var accordionTabs = $(this).closest('.accordion-tabs')
      accordionTabs.find('.is-open').removeClass('is-open').hide();

      $(this).next().toggleClass('is-open').toggle();
      accordionTabs.find('.is-active').removeClass('is-active');
      $(this).addClass('is-active');
    } else {
      event.preventDefault();
    }
  });
 //Eval form JS
  $('#tasks').on('cocoon:before-insert', function(e, category) {
    category.fadeIn('slow');
  });

$('.datepicker').datepicker();
});