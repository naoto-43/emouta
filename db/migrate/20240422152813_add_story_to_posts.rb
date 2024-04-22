class AddStoryToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :story, :text
  end
end
