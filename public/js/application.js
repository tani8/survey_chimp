$(document).ready(function() {
  $('.add_question_button').on("click", function(event){
    event.preventDefault();
    var form = $($('.question_area')[0]).clone();
    form.appendTo(".question_number");
  })
});
