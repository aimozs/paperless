class AddRelationshipToMealPlan < ActiveRecord::Migration
  def change
    add_column :meal_plans, :trainer_id, :integer
    add_column :meal_plans, :client_id, :integer
  end
end
