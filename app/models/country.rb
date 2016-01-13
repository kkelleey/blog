class Country < ActiveRecord::Base
  has_many :posts, through: :cities
  has_many :cities

  has_attached_file :logo,
    styles: {
      thumb: "100x100#",
      medium: "250x200#",
  }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
