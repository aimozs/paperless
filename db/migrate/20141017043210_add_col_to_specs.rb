class AddColToSpecs < ActiveRecord::Migration
  def change
  	add_column :specs, :weight_cl, :integer
  	add_column :specs, :set_cl, :integer
  	add_column :specs, :rep_cl, :integer
  	add_column :specs, :note, :text

  end
end
