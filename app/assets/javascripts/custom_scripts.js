$(document).ready(function() {
  // SCROLL 
  function scrollToAnchor(aid){
    var aTag = $(aid);
    $('html,body').animate({scrollTop: aTag.offset().top},'slow');
  }

  // USER PAGE SCROLL
  Array.from($(".tongue-bottom")).forEach(function(element) { $(element).on("click", function(event) {
    event.preventDefault(); scrollToAnchor($("body"))
  }) })

})


  

