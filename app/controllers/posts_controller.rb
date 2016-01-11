class PostsController < ApplicationController
  has_scope :by_country

  # GET /posts
  def index
    @posts = apply_scopes(Post).order(created_at: :desc).first(5)
    @tiles = Tile.generate_tiles(10)
  end
end
