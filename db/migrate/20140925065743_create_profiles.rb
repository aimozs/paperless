class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
