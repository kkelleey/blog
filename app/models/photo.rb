class Photo < ActiveRecord::Base
  belongs_to :country
  has_attached_file :image,
    styles: {
    thumb: "100x100#",
    small: "x250",
    medium: "300x300" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
