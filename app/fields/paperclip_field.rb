require "administrate/field/base"

class PaperclipField < Administrate::Field::Base
  def to_s
    data
  end

  def thumbnail
    data.url(:thumb)
  end

  def url
    data.url
  end
end
