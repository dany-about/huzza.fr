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
  
  // PARTICIPATION CARD: Toggle Tabs on hover
  // Array.from($(".eventCard")).forEach(function(element) { $(element).on( "mouseenter mouseleave", function() {
  //   $(this.childNodes[3]).toggleClass("collapse")
  // }) })
  
  // CARD: Toggle Tabs Content
  var cardElements = [".cardDescription",".cardComments",".cardRating",".cardProof"]
  var tab_nbrs = [5,7,9,11]
  cardElements.forEach( (element,i) => {
    Array.from($(element)).forEach(function(element) { $(element).on("click", function() { 
      let dad = this.parentNode.parentNode
      let array = [5,7,9,11]
      delete array[i]; array = array.filter( i => i )
      array.forEach( (nbr) => { if(!$(dad.childNodes[nbr]).hasClass('collapse')) { $(dad.childNodes[nbr]).addClass('collapse') } })
      $(dad.childNodes[tab_nbrs[i]]).toggleClass("collapse")
      scrollToAnchor($(dad))  
    }) })
  })

  // CARD: Toggle Description on click
  Array.from($(".cardTitle")).forEach(function(element) { $(element).on("click", function() { 
    let dad = this.parentNode.parentNode.parentNode.parentNode
    console.log(dad)
    let array = [5,7,9,11]
    let answer = true
    array.forEach( (nbr) => { if(!$(dad.childNodes[nbr]).hasClass('collapse')) { $(dad.childNodes[nbr]).addClass('collapse'); answer = false } })
    if(answer) { $(dad.childNodes[5]).toggleClass("collapse") }
  }) })

  // CLOSE TABS ON OUTSIDE CLICK
  function closeOnClickOutside(element){						
     $(window).on("click.Bst", function(event){		
      if ( $(element).has(event.target).length == 0 && !$(element).is(event.target)){
        Array.from($(element).find('.cardElementCanBeHidden')).forEach(function(child) { if(!$(child).hasClass('collapse')) {$(child).addClass('collapse')} })
      }
    })
  }
  Array.from($(".eventCard")).forEach(function(element) { closeOnClickOutside(element)})
  
})
  
    