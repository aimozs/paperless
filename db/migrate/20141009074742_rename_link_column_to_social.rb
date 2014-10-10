class RenameLinkColumnToSocial < ActiveRecord::Migration
  def change
  	rename_column :profiles, :link, :social
  end
end
