$(() => { 

// CREATE A PARTICIPATION

// le boutton aura pour classe : "participateToDare" et pour id l'id du dare (si la carte est une participation, id=#{participation.dare.id})
Array.from($(".participateToDare")).forEach(function(element) { $(element).on("click", function() { 
  let id = this.attr('id')
  //  Je laisse le ruby en commentaire tant que le fichier est pas .js.erb
  //  <% Participation.create!(user: current_user, dare: Dare.find(id)) %>
  //  <% current_user.notify_friends(Dare.find(id), "participation_created") %>

}) })








})