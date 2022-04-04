json.array! current_user.places do |place|
  json.id place.id
  json.category place.category
  json.lng place.lng
  json.lat place.lat
  json.name place.name
  json.description place.description
  json.average_rating place.average_rating
  json.current place.user == current_user
end
