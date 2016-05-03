class PhotosController < ApplicationController
  has_scope :by_city

  def index
    @photos = apply_scopes(Photo).order(created_at: :desc)
    if params[:by_city]
      @city = City.find(params[:by_city])
    else
      @photos = @photos.with_location
    end
  end
end
