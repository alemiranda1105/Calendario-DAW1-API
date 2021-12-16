json.id @user.id
json.username @user.username
json.email @user.email
json.groupid do
    json.array! @user.group_users.each do |group|
        json.group group.group_id
    end
end