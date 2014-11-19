class RemoveRelationshipFromMealPlan < ActiveRecord::Migration
  def change
    remove_column :meal_plans, :trainer_id, :integer
    remove_column :meal_plans, :client_id, :integer
  end
end
