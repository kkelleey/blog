class Post < ActiveRecord::Base
  belongs_to :city
  scope :by_country, -> country do
    joins(:city).where(cities: { country_id: country })
  end
end
