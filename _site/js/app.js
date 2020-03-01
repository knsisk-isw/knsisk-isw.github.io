$(document).ready(function(){
  $('.parallax').parallax();
  $('.modal').modal();
});

// Przewijane tło nagłówka
$(window).scroll(function() {
  $("#header").css('background-position', 'center -' + $(window).scrollTop() / 3 + 'px');
});

// Przewijane poziomy
$(window).scroll(function() {
  $(".horizontal").css('background-position', '-' + $(window).scrollTop() / 2.5 + 'px 0');
});

// Odkrywanie elementów
window.sr = ScrollReveal({rotate: {x: 20}});
sr.reveal('.reveal');
sr.reveal('.revealTop', {origin: 'left', delay: '1000'});
sr.reveal('.revealSlow', {duration: 1000});
sr.reveal('.cardReveal');

// Padaczka przycisku rejestracji do listy
sr.reveal('.registerDiv', {
  duration: 1000,
  afterReveal: function (domEl) {
    setInterval(function () {
      $('#registerButton').velocity("callout.shake", {delay: 5000});
    }, 1000);
  }
});

// Miś
/// Obracamy żar
var heatAngle = 0;
setInterval(function() {
    heatAngle += 0.09;
    $("#heat").rotate(heatAngle);
}, 20);

/// Powtarzalna konsumpcja
var headAngle = 0;
var headDirection = 1;
var headSpeed = 0.125;
var headSkew = 0.5;
var headTime = 0;
var headPause = 150;
var headDuration = 200;
setInterval(function() {
    headTime++;
    if (headTime > headPause) {
        headAngle += headDirection * headSpeed;
        $("#head").rotate(headAngle);
        $("#pizza").rotate(-headAngle);

        if (headAngle > headSkew) {
            headDirection = -1;
        }
        if (headAngle < -headSkew) {
            headDirection = 1;
        }
    }
    if (headTime > headDuration) {
        headTime = 0;
    }
}, 20);
