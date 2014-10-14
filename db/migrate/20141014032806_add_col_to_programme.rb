class AddColToProgramme < ActiveRecord::Migration
  def change
    add_column :specs, :weight, :integer
  end
end
