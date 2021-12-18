json.id @user.id
json.username @user.username
json.email @user.email
json.groupid do
  json.array! @user.group_users.each do |group|
    json.group group.group_id
  end
end
json.friends do
  json.array! @user.friendships do |friend|
    json.friend friend.id
  end
end
json.friendRequest do
  json.array! @user.friend_requests do |request|
    json.request do
      json.id request.id
      json.sender request.sender
    end
  end
end
json.events do
  json.array! @user.events do |event|
    json.event do
      json.id event.id
      json.name event.name
      json.description event.description
      json.date event.date
      json.individual event.individual
    end
  end
end