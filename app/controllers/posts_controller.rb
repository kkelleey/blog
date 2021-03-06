class PostsController < ApplicationController
  has_scope :by_country
  has_scope :by_city

  # GET /posts
  def index
    @posts = apply_scopes(Post)
             .with_location
             .order(created_at: :desc).first(5)
    @tiles = TileList.new.tiles
  end
end
