json.array! current_user.participations do |participation|
  json.id participation.id
  json.name participation.event.place.name
  json.event_name participation.event.name
  json.time participation.event.time
end
