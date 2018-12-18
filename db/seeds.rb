# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Court.create(district: 'Jaroszówka', school: 'SP 32', area: '2m2', subsoil_type: 'grass' )
User.create(name: 'Igor Igorowski', email: "igor@rosja.com", password: '123456', phone: '123123123')
