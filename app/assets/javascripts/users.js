$(document).on('page:load ready', function(){
  var avgs = $('.avg-dial')

  for (var i=0; i<avgs.length; i++){
    var max = JSON.parse(avgs[i].dataset.max)
    $(avgs[i]).knob({
      'max': max,
      'readOnly': true
    })
  }
})