$(document).on('page:load ready', function(){
  var avgs = $('.dial')
  var first = $('.info-card-knob')[0]
  for (var i=0; i<avgs.length; i++){
    $(avgs[i]).knob({
      'readOnly': true,
      'lineCap': 'round',
      'thickness': .2,
      'width': parseFloat($(first).css('width')) - 15,
      'height': parseFloat($(first).css('width')) - 15,
      'fgColor': '#2DD959',
      'font': 'inherit'
    })
  }
  // Overrides existging margins to make them RIGHT (spent too much time on that)
  $('.dial').css({'margin-top':'-5em', 'margin-left':'1.563em'})
})