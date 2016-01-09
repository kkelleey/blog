require "administrate/fields/base"

class PaperclipField < Administrate::Field::Base
  def to_s
    data
  end

  def thumbnail
    data.url(:thumbnail)
  end

  def url
    data.url
  end
end
