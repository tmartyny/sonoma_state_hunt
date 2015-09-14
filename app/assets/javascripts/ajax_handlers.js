$(function() {
  ajaxHandler(); 
});

var ajaxHandler = function() {
  $('.container').on('ajax:success', 'form[data-remote=true]', function(event, data, status, xhr){
    $(".challenge_body").empty(); //remove current contents of screen
    $(".challenge_body").append(data); //display new challenge
  }).bind("ajax:error", function(e, xhr, status, error) {
    console.log("Ajax Error!");
  });
};

