$(document).ready(function(){
  $('form#new-survey').on('submit', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.toggle(false);

    $.ajax({
      type: 'POST',
      url: $target.attr("action"),
      data: $target.serialize()
    }).done(function(response){
      $('#new-survey-div').prepend('<h2>'+":survey"+'</h2>');
      $('#preview-div').append(response);

      // TODO: Survery title to display in prepend
    });
  });
});
