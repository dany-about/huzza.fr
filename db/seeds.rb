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

category = Category.create(name: "defis de base")
category1 = Category.create(name: "defis intermediaires")
category2 = Category.create(name: "defis pro")

admin = User.create!(email: 'nabooadmin@yopmail.com', password: '123456', password_confirmation: '123456', first_name: "God,", last_name: "I mean Dany")
admin2 = User.create!(email: 'nabooadmin@yopmail.com2', password: '123456', password_confirmation: '123456')
noe = User.create!(email: "example@example.gmail", password:"123456", password_confirmation: "123456", first_name: "Noé", last_name: "Margui")


dare1 = Dare.create!(title: "first dare", description: "test "*30, creator: admin, category: category)
DifficultyRating.create!(user: admin, dare: dare1, rating: 20)
dare2 = Dare.create!(title: "second dare", description: "test2 "*30, creator: admin2, category: category)
DifficultyRating.create!(user: admin, dare: dare2, rating: 50)
dare_noe = Dare.create!(creator: noe, title: "Go paragliding above Annecy lake with my two sweet girlfriends and their anaconda who loves flying too", description: "Hi folks! I'm really happy to introduce you to my new personnal challenge. I'm fond of airplanes since my early childhood, and i'm now deeply motivated into flying as a bird. I'm not brave enough for skydiving, thats why paragliding seems perfect for me lol. Give me strengh in upvoting my dare ! Cheers", category: category)
DifficultyRating.create!(user: admin, dare: dare_noe, rating: 80)

participation1 = Participation.create!(user: admin, dare: dare1)
participation_noe = Participation.create!(user: noe, dare: dare_noe)
participation = Participation.create!(user: noe, dare: dare2)

sent_dare1 = UserSendDare.create!(dare: dare1, sender: admin, recipient:admin2)
sent_dare2 = UserSendDare.create!(dare: dare2, sender: admin2, recipient:admin)


notif2 = News.create!(user: admin, friend: noe, event: participation_noe, occasion: "participation_created")
notif2 = News.create!(user: admin, friend: noe, event: participation_noe, occasion: "participation_created")

Follow.create!(user: noe, follower: admin)
Follow.create!(user: admin, follower: noe)

StarDare.create!(user: admin, dare: dare1)

Comment.create!(commentable: dare_noe, user: admin, content: "testcom sur défi")
Comment.create!(commentable: participation_noe, user: admin2, content: "Oui ceci est bien un vrai commentaire généré par le seed et on est trop des bgs")
Comment.create!(commentable: participation_noe, user: admin, content: "Trop bien ce défi quel courage ce Noé")
Comment.create!(commentable: participation_noe, user: noe, content: "Eh oui je commente mon propre défi car au fond de moi je suis un plouc !")

News.create!(user: admin, friend: noe, event: dare_noe, occasion: "dare_sent_to_#{admin.id}_from_#{noe.id}")