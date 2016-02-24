class Photo < ActiveRecord::Base
  belongs_to :city
  scope :with_location, -> { includes(:city, city: :country) }
  scope :by_country, -> country do
    joins(:city).where(cities: { country_id: country })
  end
  scope :by_city, -> city { where(city: city) }

  has_attached_file :image,
    styles: {
    thumb: "100x100#",
    small: "x250",
    medium: "250x200#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
