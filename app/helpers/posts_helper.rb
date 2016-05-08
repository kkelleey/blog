module PostsHelper
  def logo_image_tag(tile)
    image_tag tile[:src], title: "See all posts from #{tile[:country_name]}"
  end
end
