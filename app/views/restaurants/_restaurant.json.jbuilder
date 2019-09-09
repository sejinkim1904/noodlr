json.extract! restaurant, :id, :name, :latitude, :longitude, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
