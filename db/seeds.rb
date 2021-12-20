# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ username:'pepe', email:'pepe', password:'12345' }, { username:'maria', email:'maria', password:'12345' },
                     { username:'paco', email:'paco', password:'12345' }, { username:'jose', email:'jose', password:'12345' },
                     { username:'marcos', email:'marcos', password:'12345' }, { username:'tuma', email:'tuma', password:'12345' }])
groups = Group.create([{ name:"universidad" }, {name:"futbol"}, {name: "tenis"}])





