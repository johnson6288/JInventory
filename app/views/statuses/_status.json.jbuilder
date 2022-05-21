json.extract! status, :id, :statusName, :comments, :created_at, :updated_at
json.url status_url(status, format: :json)
