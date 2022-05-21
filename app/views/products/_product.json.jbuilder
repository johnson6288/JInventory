json.extract! product, :id, :productName, :system, :status, :type, :comments, :created_at, :updated_at
json.url product_url(product, format: :json)
