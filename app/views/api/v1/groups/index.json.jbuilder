json.data do
  json.array! @groups do |group|
    json.name group.name
    json.users do
      json.array! group.group_users.each do |user|
        json.user user.id
      end
    end
  end
end