json.id @group.id
json.name @group.name
json.users do
    json.array! @group.group_users.each do |user|
        json.user user.id
    end
end
json.events do
  json.array! @group.events do |event|
    json.event do
      json.id event.id
      json.name event.name
      json.description event.description
      json.date event.date
      json.individual event.individual
    end
  end
end