$(document).on('page:load ready', function(){
  $('.roster-links').on('click', function(ev){
    ev.preventDefault();
    var rosterParams = $(this).attr('id');
    console.log(rosterParams)

    $.getScript('/rosters?selected=' + rosterParams).done(function(){
      createRings()
    });
  })
})