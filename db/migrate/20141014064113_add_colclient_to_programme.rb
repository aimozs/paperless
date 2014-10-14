class AddColclientToProgramme < ActiveRecord::Migration
  def change
    add_column :programmes, :client, :integer
  end
end
