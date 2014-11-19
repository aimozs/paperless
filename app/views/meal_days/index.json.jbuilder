json.array!(@meal_days) do |meal_day|
  json.extract! meal_day, :id, :day, :date, :breakfast, :lunch, :dinner, :snack, :meal_plan_id
  json.url meal_day_url(meal_day, format: :json)
end
