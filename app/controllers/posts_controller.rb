class PostsController < ApplicationController
  has_scope :by_country
  has_scope :by_city

  # GET /posts
  def index
    @posts = apply_scopes(Post)
             .with_city
             .with_photos_boolean
             .order(created_at: :desc).first(5)
    @tiles = Tile.generate_tiles(10)
  end
end
