class ChangeCol < ActiveRecord::Migration
  def change
  	change_column :programmes, :client, :integer
  end
end
