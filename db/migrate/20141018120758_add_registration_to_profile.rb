class AddRegistrationToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :bodyfat, :decimal
    add_column :profiles, :injuries, :text
    add_column :profiles, :gender, :string
    add_column :profiles, :age, :integer
    add_column :profiles, :agreed, :boolean
  end
end
