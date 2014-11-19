class AddDayToMealJournal < ActiveRecord::Migration
  def change
    add_column :meal_journals, :day, :string
  end
end
