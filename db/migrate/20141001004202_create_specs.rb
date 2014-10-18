class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.time :time
      t.integer :weight
      t.integer :set
      t.integer :rep
      t.string :tempo
      t.references :programme, index: true
      t.references :exercise, index: true

      t.timestamps
    end
  end
end
