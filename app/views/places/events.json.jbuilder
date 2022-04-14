json.array! @events do |event|
  json.id event.id
  json.name event.name
  json.time event.time
  json.participated event.participations.any? {|p| p.user == current_user }
  json.passed event.passed
end
