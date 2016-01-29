class PhotosController < ApplicationController
  has_scope :by_country
  has_scope :by_city

  def index
    @photos = apply_scopes(Photo).with_location.order(created_at: :desc)
    if params[:by_city]
      @city = City.find(params[:by_city])
    end
  end
end
