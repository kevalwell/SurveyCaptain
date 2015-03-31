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

  $('#preview-div').on('submit','form#new_questions', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.children('input[type=submit]').toggle(false);
    $target.children('a').toggle(false);
    $.ajax({
      type: 'POST',
      url: $target.attr("action"),
      data: $target.serialize()
    }).done(function(response){
      $("#preview-div").append(response);
      // $target[0].reset(); //reset all inputs of the form
      // $target.children('input[type=submit]').val("Create Question");
    });
  });
});
