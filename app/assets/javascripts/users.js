$(document).on('page:load ready', function(){
  var avgs = $('.dial')

  for (var i=0; i<avgs.length; i++){
    $(avgs[i]).knob({
      'readOnly': true
    })
  }
})