class RemoveEngagementFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :agreed, :string
    remove_column :profiles, :age, :string
  end
end
