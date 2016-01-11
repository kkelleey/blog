class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.order(created_at: :desc).first(5)
    @tiles = Tile.generate_tiles(10)
  end
end
