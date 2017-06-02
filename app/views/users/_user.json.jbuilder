json.extract! user, :id, :name, :registration, :office, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
