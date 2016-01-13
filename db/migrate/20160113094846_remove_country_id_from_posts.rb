class RemoveCountryIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :country_id, :integer
  end
end
