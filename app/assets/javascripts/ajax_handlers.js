$(function() {
  renderChallenge();
  // createSubmissionHandler(); //submit form for user solution
});

var createSubmissionHandler = function() {
  $('.container').on('submit', '#form_submission', function(event){
    event.preventDefault();
    var form_data = $(this).serialize();
    var request = $.ajax({
      url: this.action,
      type: this.method,
      data: form_data
    });

    request.done(function(response) {
      successMessage = "<span class='success'><p>Excellent!</p><p>Watch the video on the left to learn more.</p><p>Click 'Next Clue' to move along to the next clue. You're on a roll!</p><p>Don't forget to keep an eye on the clock.</p><p>You have ## landmarks left to find.</p></span>"
      $("#form_submission").remove(); //remove the submission form
      $("#challenge_media").append(response); //add the video and next button
      $("#challenge_clue").append(successMessage); //add the success message below clue
    });

    request.fail(function(jqXHR, textStatus, errorThrown) {
      var error = errorThrown;
      console.log("fail" + error);
    });
  });
};

var renderChallenge = function() {
  $('.container').on('ajax:success', 'a[data-remote=true]', function(event, data, status, xhr){
    $(".challenge_body").empty(); //remove current contents of screen
    $(".challenge_body").append(data); //display new challenge
  });
};


