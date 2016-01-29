class Post < ActiveRecord::Base
  belongs_to :city
  scope :by_country, -> country do
    joins(:city).where(cities: { country_id: country })
  end
  scope :by_city, -> city { where(city: city) }

  def self.with_city
    includes(:city)
  end
end
