class RenameLinkToVideo < ActiveRecord::Migration
  def change
  	rename_column :exercises, :link, :video
  end
end
