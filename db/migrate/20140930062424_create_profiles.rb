class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.decimal :height
      t.decimal :weight
      t.string :social
      t.references :user, index: true

      t.timestamps
    end
  end
end
