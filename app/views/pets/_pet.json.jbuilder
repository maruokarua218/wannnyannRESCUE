json.extract! pet, :id, :image, :gender, :type, :prefectures_name, :content, :created_at, :updated_at
json.url pet_url(pet, format: :json)
