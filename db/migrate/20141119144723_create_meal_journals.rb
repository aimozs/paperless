class CreateMealJournals < ActiveRecord::Migration
  def change
    create_table :meal_journals do |t|
      t.references :meal_day, index: true
      t.date :date
      t.string :meal
      t.string :ate
      t.references :user, index: true

      t.timestamps
    end
  end
end
