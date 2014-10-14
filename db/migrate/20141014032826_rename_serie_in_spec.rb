class RenameSerieInSpec < ActiveRecord::Migration
  def change
  	rename_column :specs, :serie, :set
  end
end
