class AddTrainerToClient < ActiveRecord::Migration
  def change
    add_column :clients, :trainer, :integer
  end
end
