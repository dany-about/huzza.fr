# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FriendRequest.destroy_all
Accomplishment.destroy_all
DifficultyRating.destroy_all
Reaction.destroy_all
Comment.destroy_all
News.destroy_all
StarDare.destroy_all
Participation.destroy_all
UserSendDare.destroy_all
Dare.destroy_all
Follow.destroy_all
User.destroy_all
Category.destroy_all

category_1 = Category.create(name: "Aventure", image_url:"https://images.pexels.com/photos/672358/pexels-photo-672358.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_2 = Category.create(name: "Sport", image_url:"https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_3 = Category.create(name: "Art", image_url:"https://images.pexels.com/photos/1053687/pexels-photo-1053687.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_4 = Category.create(name: "Eco-friendly", image_url:"https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_5 = Category.create(name: "Caritatif", image_url:"https://images.pexels.com/photos/933624/pexels-photo-933624.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_6 = Category.create(name: "Voyage", image_url:"https://images.pexels.com/photos/1118448/pexels-photo-1118448.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_7 = Category.create(name: "Bien-être", image_url:"https://images.pexels.com/photos/1263986/pexels-photo-1263986.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_8 = Category.create(name: "Expériences", image_url:"https://images.pexels.com/photos/1670732/pexels-photo-1670732.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_9 = Category.create(name: "Gaming", image_url:"https://images.pexels.com/photos/442576/pexels-photo-442576.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
category_10 = Category.create(name: "WTF", image_url:"https://images.pexels.com/photos/1564506/pexels-photo-1564506.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")

Accomplishment.create!(title: "No Longer A Newcomer", name: "Mon premier défi créé !", icon_class:"fas fa-money-bill-alt")
Accomplishment.create!(title: "Michael Scott", name: "Mon premier ami !", icon_class:"fas fa-user-friends")
Accomplishment.create!(title: "Dare Or Dare", name: "Mon premier challenge envoyé !", icon_class:"fas fa-paper-plane")
Accomplishment.create!(title: "A New Adventure Begins", name: "Ma première participation à un défi !", icon_class:"fas fa-fire")
Accomplishment.create!(title: "Look At Me", name: "Mon premier trophée posté !", icon_class:"fas fa-eye")
Accomplishment.create!(title: "The Rock", name: "Mon premier défi réalisé !", icon_class:"fas fa-hand-rock")
Accomplishment.create!(title: "Model Citizen", name: "Mon premier vote de difficulté !", icon_class:"fas fa-vote-yea")
Accomplishment.create!(title: "Serial Rater", name: "A voté 10 fois la difficulté d'un défi", icon_class:"fas fa-sort-numeric-up")
Accomplishment.create!(title: "The Gossip Master", name: "A commenté 20 fois", icon_class:"fas fa-comments")
Accomplishment.create!(title: "Serial Beginner", name: "Plus de 5 défis à mon actif.", icon_class:"fas fa-skull-crossbones")

Accomplishment.create!(title: "Mike Horn", name: "A réussi 5 défis dans la catégorie Aventure.", icon_class:"fas fa-campground")
Accomplishment.create!(title: "Olypic Games", name: "A réussi 5 défis dans la catégorie Sport.", icon_class:"fas fa-injured")
Accomplishment.create!(title: "Picasso", name: "A réussi 5 défis dans la catégorie Art.", icon_class:"fas fa-palette")
Accomplishment.create!(title: "WWF", name: "A réussi 5 défis dans la catégorie Green.", icon_class:"fas fa-paw")
Accomplishment.create!(title: "Les Enfoirés", name: "A réussi 5 défis dans la catégorie Charity.", icon_class:"fas fa-users")
Accomplishment.create!(title: "Jules Vernes", name: "A réussi 5 défis dans la catégorie Travel.", icon_class:"fas fa-globe-europe")
Accomplishment.create!(title: "Tim Harris", name: "A réussi 5 défis dans la catégorie Self-Help.", icon_class:"fas fa-spa")
Accomplishment.create!(title: "Mister Bucket", name: "A réussi 5 défis dans la catégorie Experiences.", icon_class:"fas fa-list-ol")
Accomplishment.create!(title: "Geek 2.0", name: "A réussi 5 défis dans la catégorie Gaming.", icon_class:"fas fa-gamepad")
Accomplishment.create!(title: "Jean Michel Blague", name: "A réussi 5 défis dans la catégorie WTF.", icon_class:"fas fa-spider")

admin = User.create!(email: 'nabooadmin@yopmail.com', password: '123456', password_confirmation: '123456', first_name: "God,", last_name: "I mean Dany")
noe = User.create!(email: "example@example.gmail", password:"123456", password_confirmation: "123456", first_name: "Noé", last_name: "Margui")

# les defis de base
dare_landing = Dare.create!(creator: noe, title: "Faire Paris - Montcuq en autostop sans dépenser le moindre euro", description: "Je projette cet été de me rendre à Montcuq, pour y faire le tour à pieds. La SNCF n'ayant, à mon grand regret, pas encore déployée de ligne à grande vitesse à destination de Montcuq, j'ai pris la lourde décision de m'y rendre en stop. Et toi, tu seras où cet été ?", category: category_2)
dare_noe = Dare.create!(creator: noe, title: "Go paragliding above Annecy lake with my two sweet girlfriends and their anaconda who loves flying too", description: "Hi folks! I'm really happy to introduce you to my new personnal challenge. I'm fond of airplanes since my early childhood, and i'm now deeply motivated into flying as a bird. I'm not brave enough for skydiving, thats why paragliding seems perfect for me lol. Give me strengh in upvoting my dare ! Cheers", category: category_3)
DifficultyRating.create!(user: admin, dare: dare_noe, rating: 80)
dare2 = Dare.create!(title: "Street clining in Hong Kong", description: "put in the trash garbage you find in the street " *3, creator: admin, category: category_4)
DifficultyRating.create!(user: admin, dare: dare2, rating: 30)
dare3 = Dare.create!(title: "Skydiving in Los Angeles with my homies", description: "Jump off a plane from 4000 meters high... "*3, creator: admin, category: category_3)
DifficultyRating.create!(user: admin, dare: dare3, rating: 90)
dare4 = Dare.create!(title: "Climb on top of the Eiffel Tower in Paris", description: "walk up the 1665 stairs of the tower, take a photo every 200 steps "*3, creator: admin, category: category_3)
DifficultyRating.create!(user: admin, dare: dare4, rating: 30)
dare5 = Dare.create!(title: "Shave your head, and go bowling with some friends", description: "shave totally your head, and throw yourself head forward in a bowling alley, do strike"*3, creator: admin, category: category_9)
DifficultyRating.create!(user: admin, dare: dare5, rating: 50)
dare6 = Dare.create!(title: "Be a human charger for a couple of hours", description: "ask people to charge their smartphone, use an external battery charger, meanwhile...have a chat with them"*3, creator: admin, category: category_8)
DifficultyRating.create!(user: admin, dare: dare6, rating: 20)
dare7 = Dare.create!(title: "Run a marathon in New York", description: "run a marathon under 10 hours... with merged laces "*3, creator: admin, category: category_9)
DifficultyRating.create!(user: admin, dare: dare7, rating: 60)
dare8 = Dare.create!(title: "Order foreign food in a foreign language", description: "you must order your dish without speaking the native language, you can bring a dictionary, take a video"*3, creator: admin, category: category_7)
DifficultyRating.create!(user: admin, dare: dare8, rating: 10)
dare9 = Dare.create!(title: "Get your own floating party baby", description: "get a nautic license, rent a yatch, invite people and have a huge party"*3, creator: admin, category: category_10)
DifficultyRating.create!(user: admin, dare: dare9, rating: 30)
dare10 = Dare.create!(title: "First destination by the first plane", description: "buy a ticket for the next flight no matter the destination, don't bring any luggage "*3, creator: admin, category: category_2)
DifficultyRating.create!(user: admin, dare: dare10, rating: 40)
dare11 = Dare.create!(title: "Fruit street in Bangkok wearing a shorty", description: "buy some fruits, walk down the streets, give some to homeless people"*3, creator: admin, category: category_5)
DifficultyRating.create!(user: admin, dare: dare11, rating: 30)