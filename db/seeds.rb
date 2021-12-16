# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ username:'pepe', email:'pepe', password:'12345' }, { username:'maria', email:'maria', password:'12345' }])
groups = Group.create([{ name:"test1" }, {name:"test2"}])

for g in groups do
    for u in users do
        GroupUser.create(user_id: u.id, group_id: g.id)
    end
end
