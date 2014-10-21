class AddEngagementToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :engagement, :text
  end
end
