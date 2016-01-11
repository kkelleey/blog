class Post < ActiveRecord::Base
  belongs_to :country
  scope :by_country, -> country { where(country: country) }
end
