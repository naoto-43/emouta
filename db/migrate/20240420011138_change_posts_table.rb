class ChangePostsTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :lyricks, :lyrics
    remove_column :posts, :coment, :text 
  end
end
