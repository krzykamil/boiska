# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Court.create(district: 'Jaroszówka', school: 'SP 32', width: 80, length: 120, subsoil_type: 'grass', open_from: '12:00:00', open_to: '22:00:00')
User.create(name: 'Igor Igorowski', email: 'igor@rosja.com', password: '123456', phone: '123123123')
