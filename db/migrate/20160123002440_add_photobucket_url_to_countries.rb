class AddPhotobucketUrlToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :photobucket_url, :string
  end
end
