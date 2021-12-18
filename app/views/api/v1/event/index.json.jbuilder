json.array! @events do |event|
  json.id event.id
  json.name event.name
  json.description event.description
  json.date event.date
  json.individual event.individual
end