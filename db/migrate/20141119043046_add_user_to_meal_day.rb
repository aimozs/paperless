class AddUserToMealDay < ActiveRecord::Migration
  def change
    add_reference :meal_days, :user, index: true
  end
end
