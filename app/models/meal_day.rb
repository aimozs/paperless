class MealDay < ActiveRecord::Base
  belongs_to :user
  has_many :meal_journals
end
