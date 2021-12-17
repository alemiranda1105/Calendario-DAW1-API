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
end