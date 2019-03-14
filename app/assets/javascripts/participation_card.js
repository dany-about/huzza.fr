$(() => { 

// PARTICIPATION CARD: Toggle Tabs on hover
Array.from($(".participationCard")).forEach(function(element) { $(element).hover(function() {
  $(this.childNodes[3]).toggleClass("collapse")
}) })

// CARD: Toggle Tabs Content
var cardElements = [".cardDescription",".cardComments",".cardRating",".cardProof"]
var tab_nbrs = [5,7,9,11]
cardElements.forEach( (element,i) => {
  Array.from($(element)).forEach(function(element) { $(element).on("click", function() { 
    let dad = this.parentNode.parentNode
    let array = [5,7,9,11]
    delete array[i]; array = array.filter( i => i )
    console.log(array)
    array.forEach( (nbr) => { if(!$(dad.childNodes[nbr]).hasClass('collapse')) { $(dad.childNodes[nbr]).addClass('collapse') } })
    $(dad.childNodes[tab_nbrs[i]]).toggleClass("collapse")  
  }) })
})
  
})

