class RenameStatusToState < ActiveRecord::Migration
  def change
    rename_column :programmes, :status, :state
  end
end
