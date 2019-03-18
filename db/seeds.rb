# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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


category2 = Category.create(name: "adventure")
category3 = Category.create(name: "sport")
category4 = Category.create(name: "art")
category5 = Category.create(name: "charity")
category6 = Category.create(name: "girly")
category7 = Category.create(name: "green")
category8 = Category.create(name: "funny")
category9 = Category.create(name: "WTF")
category10 = Category.create(name: "gaming")
category12 = Category.create(name: "other")

admin = User.create!(email: 'nabooadmin@yopmail.com', password: '123456', password_confirmation: '123456', first_name: "God,", last_name: "I mean Dany")
admin2 = User.create!(email: 'nabooadmin@yopmail.com2', password: '123456', password_confirmation: '123456')
noe = User.create!(email: "example@example.gmail", password:"123456", password_confirmation: "123456", first_name: "Noé", last_name: "Margui")

# les defis de base
dare_noe = Dare.create!(creator: noe, title: "Go paragliding above Annecy lake with my two sweet girlfriends and their anaconda who loves flying too", description: "Hi folks! I'm really happy to introduce you to my new personnal challenge. I'm fond of airplanes since my early childhood, and i'm now deeply motivated into flying as a bird. I'm not brave enough for skydiving, thats why paragliding seems perfect for me lol. Give me strengh in upvoting my dare ! Cheers", category: category3)
DifficultyRating.create!(user: admin, dare: dare_noe, rating: 80)
dare3 = Dare.create!(title: "skydiving", description: "Jump off a plane from 4000 meters high... ", creator: admin, category: category3)
DifficultyRating.create!(user: admin, dare: dare3, rating: 90)
dare4 = Dare.create!(title: "climb on top of the Eiffel Tower", description: "walk up the 1665 stairs of the tower, take a photo every 200 steps ", creator: admin, category: category3)
DifficultyRating.create!(user: admin, dare: dare4, rating: 30)
dare5 = Dare.create!(title: "shave your head, and go bowling", description: "shave totally your head, and throw yourself head forward in a bowling alley, do strike", creator: admin, category: category9)
DifficultyRating.create!(user: admin, dare: dare5, rating: 50)
dare6 = Dare.create!(title: "human charger", description: "ask people to charge their smartphone, use an external battery charger, meanwhile...have a chat with them", creator: admin, category: category8)
DifficultyRating.create!(user: admin, dare: dare6, rating: 20)
dare7 = Dare.create!(title: "run a marathon", description: "run a marathon under 10 hours... with merged laces ", creator: admin, category: category9)
DifficultyRating.create!(user: admin, dare: dare7, rating: 60)
dare8 = Dare.create!(title: "order foreign food in a foreign language", description: "you must order your dish without speaking the native language, you can bring a dictionary, take a video", creator: admin, category: category7)
DifficultyRating.create!(user: admin, dare: dare8, rating: 10)
dare9 = Dare.create!(title: "get your own floating party", description: "get a nautic license, rent a yatch, invite people and have a huge party", creator: admin, category: category12)
DifficultyRating.create!(user: admin, dare: dare9, rating: 30)
dare10 = Dare.create!(title: "first destination", description: " buy a ticket for the next flight no matter the destination, don't bring any luggage ", creator: admin, category: category2)
DifficultyRating.create!(user: admin, dare: dare10, rating: 40)
dare11 = Dare.create!(title: "", description: "buy some fruits, walk down the streets, give some to homeless people", creator: admin, category: category5)
DifficultyRating.create!(user: admin, dare: dare11, rating: 30)

participation1 = Participation.create!(user: admin, dare: dare1)
participation_noe = Participation.create!(user: noe, dare: dare_noe)
participation = Participation.create!(user: noe, dare: dare2)

sent_dare1 = UserSendDare.create!(dare: dare1, sender: admin, recipient:admin2)
sent_dare2 = UserSendDare.create!(dare: dare2, sender: admin2, recipient:admin)

notif2 = News.create!(user: admin, friend: noe, event: participation_noe, occasion: "participation_created")

Follow.create!(user: noe, follower: admin)
Follow.create!(user: admin, follower: noe)
Follow.create!(user: admin2, follower: admin)

StarDare.create!(user: admin, dare: dare1)

Comment.create!(commentable: dare_noe, user: admin, content: "testcom sur défi")
Comment.create!(commentable: participation_noe, user: admin2, content: "Oui ceci est bien un vrai commentaire généré par le seed et on est trop des bgs")
Comment.create!(commentable: participation_noe, user: admin, content: "Trop bien ce défi quel courage ce Noé")
Comment.create!(commentable: participation_noe, user: noe, content: "Eh oui je commente mon propre défi car au fond de moi je suis un plouc !")

usd = UserSendDare.create!(sender: noe, recipient: admin, dare: dare_noe)
News.create!(user: admin, friend: noe, event: usd, occasion: "sent_dare")