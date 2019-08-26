# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "quint@thespace.social", password: "123456789")
p user

broker = Broker.create(name: "Swek Corp", user: user)
p broker

barge = Barge.create(barge_name: "Swek Boat", broker: broker)
p barge

oil = OilCompany.create(name: "shell", user: user)
p oil

cargo = Cargo.create(cargo_name: "gasoline", oil_company: oil)
p cargo
