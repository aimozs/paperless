json.array!(@programmes) do |programme|
  json.extract! programme, :id, :description, :due_date, :user_id
  json.url programme_url(programme, format: :json)
end
