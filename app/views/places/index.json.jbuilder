json.array! @places do |place|
  json.id place.id
  json.category place.category
  json.lat place.lat
  json.lng place.lng
  json.name place.name
  json.average_rating place.average_rating
end