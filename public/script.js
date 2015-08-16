
// this little handler allows us to use left/right keys for nav
document.addEventListener('keydown', function(event) {
  if(event.keyCode == 37) {
    var prev = document.querySelectorAll('[rel="previous"]')[0]
    document.location = prev.href
  }
  else if(event.keyCode == 39) {
    var next = document.querySelectorAll('[rel="next"]')[0]
    document.location = next.href
  }
});
