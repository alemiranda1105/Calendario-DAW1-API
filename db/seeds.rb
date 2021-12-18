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

groups.each do |g|
  users.each do |u|
    n = rand(0..2)
    GroupUser.create(user_id: u.id, group_id: g.id) if n == 1
  end
end

User.all.each do |user|
  n = 0
  while n <= 2 do
    random = rand(1..User.all.length)
    new_friend = User.find(random)
    if new_friend.id != user.id && !user.friendships.include?(new_friend)
      user.friendships << new_friend
    end
    n += 1
  end
end

User.all.each do |user|
  n = 0
  while n <= 3 do
    random = rand(1..User.all.length)
    new_request = FriendRequest.new(receiver: user.id, sender: random)
    if user.id != random && !user.friend_requests.include?(new_request)
      user.friend_requests << new_request
    end
    n += 1
  end
end

count = 0
while count < 20 do
  if count < 10
    rand_id = rand(1..User.all.length)
    user = User.find(rand_id)
    event = Event.create({ name: "Evento #{count}", description: "Esta es las desc. del evento #{count}",
                           date:"#{count}-01-2022" ,individual: true, owner_id: rand_id })
    user.events << event
  else
    rand_id = rand(1..Group.all.length)
    group = Group.find(rand_id)
    event = Event.create({ name: "Evento #{count}", description: "Esta es las desc. del evento #{count}",
                           date:"#{count}-01-2022" ,individual: false, group_id: rand_id })
    group.events << event
  end
  count += 1
end



