class MealJournal < ActiveRecord::Base
  belongs_to :meal_day
  belongs_to :user
end
