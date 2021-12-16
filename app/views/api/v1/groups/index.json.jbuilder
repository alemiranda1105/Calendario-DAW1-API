json.data do
  json.array! @groups do |group|
    json.id group.id
    json.name group.name
    json.users do
      json.array! group.group_users.each do |user|
        json.user user.user_id
      end
    end
  end
end