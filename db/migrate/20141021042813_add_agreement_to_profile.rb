class AddAgreementToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :agreed, :boolean
  end
end
