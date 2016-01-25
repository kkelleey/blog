class PhotosController < ApplicationController
  def index
    @photos = Photo.with_location.order(created_at: :desc)
  end
end
