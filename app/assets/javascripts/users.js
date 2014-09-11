$(document).on('page:load ready', function(){
  var avgs = $('.info-card-avg')

  for (var i=0; i<avgs.length; i++){
    var max = JSON.parse(avgs[i].dataset.max)
    var val = JSON.parse(avgs[i].dataset.val)
    $('avgs[i]').knob({
      'max': max,
      'readOnly': true
    }).val(val)
  }
})