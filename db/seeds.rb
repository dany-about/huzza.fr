# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contestation.destroy_all
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

admin = User.create!(email: "noe@huzza.fr", password:"123456", password_confirmation: "123456", first_name: "Noé", last_name: "Marguillard")
dany = User.create!(email: 'dany@huzza.fr', password: '123456', password_confirmation: '123456', first_name: "Dany", last_name: "About")
nans = User.create!(email: "nans@huzza.fr", password:"123456", password_confirmation: "123456", first_name: "Nans", last_name: "Noel")
nikki = User.create!(email: "nikki@huzza.fr", password:"123456", password_confirmation: "123456", first_name: "Nicolas", last_name: "Stanojevic")
aliya = User.create!(email: "akiya@huzza.fr", password:"123456", password_confirmation: "123456", first_name: "Aliyusha", last_name: "Gizatullina")

# les defis de base
dare_admin = Dare.create!(creator: admin, title: "Aller faire du parapente au dessus du lac d'Annecy avec mon lapin Maurice", description: "Je projette cet été de me rendre à Annecy, pour y faire découvrir le parapente à mon cher et tendre lapin, Maurice. Maurice a toujours aimé l'altitude, alors j'espère que ce vol le ravira.", category: category_3)
dare_dany = Dare.create!(creator: dany, title: "Prendre une photo de Charles Dacquay en slip", description: "De mémoire d'homme, personne n'a jamais vu Charles porter autre chose que son traditionnel combo chemise / blazer. Le premier qui réussira a capturer une photo de Charles ne serait-ce qu'en t-shirt sera donc déclaré gagnant. Des points supplémentaires (abstraits) ainsi que du respect supplémentaire seront accordés pour tout item de clothing en moins.", category: category_10)
dare_nans = Dare.create!(creator: nans, title: "Prendre le transilien un soir de semaine et aller dormir à la belle étoile sur une coline", description: "Quoi de mieux pour déconnecter du stress parisien qu'une belle coline bien verte ?", category: category_1)
dare_nikki = Dare.create!(creator: nikki, title: "Apprendre à jouer Despacito à la clarinette", description: "En tant que membre fondateur de l'association Despacito Paris, j'ai en tête d'apprendre l'air de ce chef d'oeuvre à la clarinette. Envoyez moi de la force !", category: category_2)
dare_aliya = Dare.create!(creator: aliya, title: "Courrir mon premier marathon à New York", description: "Montrer aux américains de quelle bois on se chauffe en terme de sport les grenouilles !", category: category_2)
