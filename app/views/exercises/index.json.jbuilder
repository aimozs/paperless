json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :name, :description, :videa
  json.url exercise_url(exercise, format: :json)
end
