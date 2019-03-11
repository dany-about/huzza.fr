# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create!({email: 'nabooadmin@yopmail.com', password: '123456', password_confirmation: '123456'})
admin2 = User.create!({email: 'nabooadmin@yopmail.com2', password: '123456', password_confirmation: '123456'})

dare1 = Dare.create!({title: "first dare", description: "test", creator: admin})
dare2 = Dare.create!({title: "second dare", description: "test2", creator: admin2})

participation1 = Participation.create!({user: admin, dare: dare1})
sent_dare1 = UserSendDare.create!({dare: dare1, sender: admin, recipient:admin2})
sent_dare2 = UserSendDare.create!({dare: dare2, sender: admin2, recipient:admin})