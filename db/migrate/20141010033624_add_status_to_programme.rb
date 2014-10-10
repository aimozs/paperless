class AddStatusToProgramme < ActiveRecord::Migration
  def change
  	add_column :programmes, :status, :string
  end
end
