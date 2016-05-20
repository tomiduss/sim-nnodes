# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Star seed"



def random_user(first_names, last_names)
  first_name = first_names.sample
  last_name = last_names.sample

  Player.where(
    name: first_name + " " + last_name,
    age: rand(18..99),
    money: 10000 ).first_or_create
end

first_names = ["Pedro", "Macarena", "Leonardo", "Javiera", "Andrés", "Catalina", "Fabián", "Susana", "Rodrigo", "Daniela"]
last_names = ["Figueroa", "Pérez", "González", "Hernández", "Rodríguez", "Olivos", "Soto", "López", "Fuentes", "Flores", "Torres", "Vásquez", "Tapia"]

#Numero de jugadore inciales

num_players = 25
#add players

num_players.times do
  #random_user(first_names, last_names)
end

puts "Players created "  + "#{Player.all.count}"

#modificar intervalo (en segundos)
casino = Casino.where(name: 'Nnodes', money: 100000000, status: 'closed', interval:3, api_key: '9331b0570a8c1089395e1761cfd7a2f7',  singleton_guard: 0).first_or_create

puts 'Seed finished'

#{"_id":3871336,"name":"Santiago","country":"CL","coord":{"lon":-70.64827,"lat":-33.45694}}
