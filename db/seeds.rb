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


category_1 = Category.create(name: "Adventure")
category_2 = Category.create(name: "Sport")
category_3 = Category.create(name: "Art")
category_4 = Category.create(name: "Green")
category_5 = Category.create(name: "Charity")
category_6 = Category.create(name: "Travel")
category_7 = Category.create(name: "Self-help")
category_8 = Category.create(name: "Experiences")
category_9 = Category.create(name: "Gaming")
category_10 = Category.create(name: "WTF")

admin = User.create!(email: 'nabooadmin@yopmail.com', password: '123456', password_confirmation: '123456', first_name: "God,", last_name: "I mean Dany")
admin2 = User.create!(email: 'nabooadmin@yopmail.com2', password: '123456', password_confirmation: '123456')
noe = User.create!(email: "example@example.gmail", password:"123456", password_confirmation: "123456", first_name: "Noé", last_name: "Margui")


# les defis de bas
dare_noe = Dare.create!(creator: noe, title: "Go paragliding above Annecy lake with my two sweet girlfriends and their anaconda who loves flying too", description: "Hi folks! I'm really happy to introduce you to my new personnal challenge. I'm fond of airplanes since my early childhood, and i'm now deeply motivated into flying as a bird. I'm not brave enough for skydiving, thats why paragliding seems perfect for me lol. Give me strengh in upvoting my dare ! Cheers", category: category_3)
DifficultyRating.create!(user: admin, dare: dare_noe, rating: 80)
dare2 = Dare.create!(title: "street clining", description: "put in the trash garbage you find in the street " *3, creator: admin, category: category_4)
DifficultyRating.create!(user: admin, dare: dare2, rating: 30)
dare3 = Dare.create!(title: "skydiving", description: "Jump off a plane from 4000 meters high... "*3, creator: admin, category: category_3)
DifficultyRating.create!(user: admin, dare: dare3, rating: 90)
dare4 = Dare.create!(title: "climb on top of the Eiffel Tower", description: "walk up the 1665 stairs of the tower, take a photo every 200 steps "*3, creator: admin, category: category_3)
DifficultyRating.create!(user: admin, dare: dare4, rating: 30)
dare5 = Dare.create!(title: "shave your head, and go bowling", description: "shave totally your head, and throw yourself head forward in a bowling alley, do strike"*3, creator: admin, category: category_9)
DifficultyRating.create!(user: admin, dare: dare5, rating: 50)
dare6 = Dare.create!(title: "human charger", description: "ask people to charge their smartphone, use an external battery charger, meanwhile...have a chat with them"*3, creator: admin, category: category_8)
DifficultyRating.create!(user: admin, dare: dare6, rating: 20)
dare7 = Dare.create!(title: "run a marathon", description: "run a marathon under 10 hours... with merged laces "*3, creator: admin, category: category_9)
DifficultyRating.create!(user: admin, dare: dare7, rating: 60)
dare8 = Dare.create!(title: "order foreign food in a foreign language", description: "you must order your dish without speaking the native language, you can bring a dictionary, take a video"*3, creator: admin, category: category_7)
DifficultyRating.create!(user: admin, dare: dare8, rating: 10)
dare9 = Dare.create!(title: "get your own floating party", description: "get a nautic license, rent a yatch, invite people and have a huge party"*3, creator: admin, category: category_10)
DifficultyRating.create!(user: admin, dare: dare9, rating: 30)
dare10 = Dare.create!(title: "first destination", description: " buy a ticket for the next flight no matter the destination, don't bring any luggage "*3, creator: admin, category: category_2)
DifficultyRating.create!(user: admin, dare: dare10, rating: 40)
dare11 = Dare.create!(title: "fruit street", description: "buy some fruits, walk down the streets, give some to homeless people"*3, creator: admin, category: category_5)
DifficultyRating.create!(user: admin, dare: dare11, rating: 30)

participation1 = Participation.create!(user: admin, dare: dare3)
participation_noe = Participation.create!(user: noe, dare: dare_noe)
participation = Participation.create!(user: noe, dare: dare2)

sent_dare1 = UserSendDare.create!(dare: dare_noe, sender: admin, recipient:admin2)
sent_dare2 = UserSendDare.create!(dare: dare2, sender: admin2, recipient:admin)

notif2 = News.create!(user: admin, friend: noe, event: participation_noe, occasion: "participation_created")

Follow.create!(user: noe, follower: admin)
Follow.create!(user: admin, follower: noe)
Follow.create!(user: admin2, follower: admin)

StarDare.create!(user: admin, dare: dare_noe)

Comment.create!(commentable: dare_noe, user: admin, content: "testcom sur défi")
Comment.create!(commentable: participation_noe, user: admin2, content: "Oui ceci est bien un vrai commentaire généré par le seed et on est trop des bgs")
Comment.create!(commentable: participation_noe, user: admin, content: "Trop bien ce défi quel courage ce Noé")
Comment.create!(commentable: participation_noe, user: noe, content: "Eh oui je commente mon propre défi car au fond de moi je suis un plouc !")

usd = UserSendDare.create!(sender: noe, recipient: admin, dare: dare_noe)
News.create!(user: admin, friend: noe, event: usd, occasion: "dare_sent")