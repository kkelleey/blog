class Country < ActiveRecord::Base
  has_attached_file :logo,
    styles: {
      thumb: "100x100#",
      medium: "250x200#",
  }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
