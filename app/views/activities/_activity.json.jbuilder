json.extract! activity, :id, :title, :state, :description, :owner, :created_at, :updated_at
json.url activity_url(activity, format: :json)
