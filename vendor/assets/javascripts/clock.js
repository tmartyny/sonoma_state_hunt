var startClock = function() {
  var startTime = Date.now();
  var endTime = startTime + 10800000;
  var countdownDate = new Date(endTime);
  $('#clock').countdown(countdownDate, function(event) {
  $(this).html(event.strftime('%H:%M:%S'));
  });
}

$(document).ready(startClock);
$(document).on('page:load', startClock);