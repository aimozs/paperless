class CreateMealDays < ActiveRecord::Migration
  def change
    create_table :meal_days do |t|
      t.string :day
      t.date :date
      t.string :breakfast
      t.string :lunch
      t.string :dinner
      t.string :snack
      t.references :meal_plan, index: true

      t.timestamps
    end
  end
end
