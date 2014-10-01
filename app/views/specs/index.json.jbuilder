json.array!(@specs) do |spec|
  json.extract! spec, :id, :time, :serie, :rep, :tempo, :programme_id, :exercise_id
  json.url spec_url(spec, format: :json)
end
