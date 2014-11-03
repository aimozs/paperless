json.array!(@clients) do |client|
  json.extract! client, :id, :email
  json.url client_url(client, format: :json)
end
