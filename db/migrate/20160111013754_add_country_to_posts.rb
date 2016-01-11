class AddCountryToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :country, index: true, foreign_key: true
  end
end
