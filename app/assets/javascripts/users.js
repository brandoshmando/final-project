$(document).on('page:load ready', function(){
  var avgs = $('.dial')
  var first = $('.info-card-knob')[0]
  for (var i=0; i<avgs.length; i++){
    $(avgs[i]).knob({
      'readOnly': true,
      'lineCap': 'round',
      'thickness': 0.3,
      'width': parseFloat($(first).css('width')) - 15,
      'fgColor': '#2DD959',
      'font': 'inherit'
    })
  }
})