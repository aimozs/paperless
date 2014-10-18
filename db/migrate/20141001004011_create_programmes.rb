class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.text :description
      t.date :due_date
      t.string :programme_status
      t.integer :client
      t.references :user, index: true

      t.timestamps
    end
  end
end
