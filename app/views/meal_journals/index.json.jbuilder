json.array!(@meal_journals) do |meal_journal|
  json.extract! meal_journal, :id, :meal_day_id, :date, :meal, :ate, :user_id
  json.url meal_journal_url(meal_journal, format: :json)
end
