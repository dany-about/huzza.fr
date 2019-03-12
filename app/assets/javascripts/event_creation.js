$(() => { 

// CREATE A PARTICIPATION

// le boutton aura pour classe : "participateToDare" et pour id l'id du dare (si la carte est une participation, id=#{participation.dare.id})
Array.from($(".participateToDare")).forEach(function(element) { $(element).on("click", function() { 
  let id = this.attr('id')
  // Je laisse le ruby en commentaire tant que le fichier est pas .js.erb
  // <% Participation.create!(user: current_user, dare: Dare.find(id)) %>
  // <% current_user.notify_friends(Dare.find(id), "participation_created") %>
}) })

// SEND A DARE

// le boutton aura pour classe : "sendDare" et pour id l'id du dare (si la carte est une participation, id=#{participation.dare.id})
// Il faudra stocker l'id du sender quelque part
Array.from($(".sendDare")).forEach(function(element) { $(element).on("click", function() { 
  let dareId = this.attr('id')
  // let recipientId = ?
  // Je laisse le ruby en commentaire tant que le fichier est pas .js.erb
  // <% UserSendDare.create!(dare: Dare.find(dareId), sender: current_user, recipient: User.find(recipientId)) %>
  // <% current_user.notify_friends(Dare.find(dareId), "dare_sent") %>
  // <% User.find(recipientId).notify_friends(Dare.find(dareId), "dare_received") %>
}) })

// 

})