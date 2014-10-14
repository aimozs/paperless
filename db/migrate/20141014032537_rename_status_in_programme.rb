class RenameStatusInProgramme < ActiveRecord::Migration
  def change
  	rename_column :programmes, :state, :programme_status
  end
end
