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
      'font': 'inherit',
      'format': function(value){
        if (isNaN(value)){
          return 0 + inputFormat(avgs[i])
        }else{
          return value + inputFormat(avgs[i])
        }
      }
    })

    function inputFormat(input){
      if(input.dataset.max){
        return ' pts'
      }else{
        return '%'
      }
    }
  }
  // Overrides existing margins to make them RIGHT (spent too much time on that)
  $('.dial').css({'margin-top':'-5em', 'margin-left':'1.563em'})
})