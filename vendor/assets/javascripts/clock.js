var startClock = function() {
  var startTime = Date.now();
  // var endTime = startTime + 1080; //for testing purposes
  var endTime = startTime + 10800000;
  var countdownDate = new Date(endTime);
  $('#clock')
    .countdown(countdownDate, function(event) {
      $(this).html(event.strftime('%H:%M:%S'));
    })
    .on('finish.countdown', function(event) {
      $(".challenge_body").html("<h4 class='text-warning'>Time is up! If you are not back at the rendezvous point at this time you will be disqualified.</h4>");
      $('#clock').addClass('disabled');
    });
}

$(document).ready(startClock);
$(document).on('page:load', startClock);