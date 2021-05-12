json.extract! photo, :id, :image, :label, :description, :created_at, :updated_at
json.url photo_url(photo, format: :json)
