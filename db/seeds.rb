# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
court = Court.create(district: 'Jaroszówka', school: 'SP 32', width: 80, length: 120, subsoil_type: 'grass', open_from: '12:00:00', open_to: '22:00:00')
supervisor = User.create(name: 'Igor Igorowski', email: 'igor@rosja.com', password: '123456', phone: '123123123')
administrator = User.create(name: 'Igor Drugi', email: 'igor_drugi@rosja.com', password: '123456', phone: '123123456')
user = User.create(name: 'Igor Trzeci', email: 'igor_trzeci@rosja.com', password: '123456', phone: '789123456')
CreateCourt.new({
  district: 'Wygoda',
  school: 'SP 1',
  subsoil_type: 'grass',
  width: 60,
  length: 100,
  administrator: administrator,
  supervisor: supervisor
},school: true).process
CreateReservation.new({school: false,
time_from: DateTime.strptime('2019-01-01 12:00', '%Y-%m-%d %H:%M'),
time_to: DateTime.strptime('2019-01-01 14:00', '%Y-%m-%d %H:%M'),
court_id: court.id,
user: user})
