if @users
  json.array! @users do |user|
    json.id user.id
    json.username user.username
    json.email user.email
    json.groupid do
        json.array! user.group_users.each do |group|
            json.group group.group_id
        end
    end
    json.friends do
      json.array! user.friendships do |friend|
        json.friend friend.id
      end
    end
    json.events do
      json.array! user.events do |event|
        json.event do
          json.id event.id
          json.name event.name
          json.description event.description
          json.date event.date
          json.individual event.individual
        end
      end
    end
  end
else
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
end