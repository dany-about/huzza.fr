$(document).ready(function() {

  // SCROLLS
  function scrollToAnchor(aid){
    var aTag = $(aid);
    $('html,body').animate({scrollTop: aTag.offset().top-60},'slow');
  }
  function scrollToElementById(id) { 
    $(`a[href='${id}']`).on("click", function(event) { event.preventDefault(); scrollToAnchor(`${id}`) })
  }
  scrollToElementById("#exampleCards")
  scrollToElementById("#showTeamMembers")

  // USER PAGE SCROLL
  Array.from($(".tongue-bottom")).forEach(function(element) { $(element).on("click", function(event) {
    event.preventDefault(); scrollToAnchor($("body"))
  }) })

  // WHATEVER THIS IS
  if($('footer').length > 0) {$('#body').addClass('withfooter')};  
    
});

function showPassword(id) {
  var x = document.getElementById(id);
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
