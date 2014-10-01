json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :name, :description, :link
  json.url exercise_url(exercise, format: :json)
end
