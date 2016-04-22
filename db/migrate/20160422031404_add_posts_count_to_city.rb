class AddPostsCountToCity < ActiveRecord::Migration
  def change
    add_column :cities, :posts_count, :integer, default: 0
  end
end
