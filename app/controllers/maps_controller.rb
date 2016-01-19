class MapsController < ApplicationController
  def index
    respond_to do |format|
      format.html {}
      format.json { render json:  City.coordinates }
    end
  end
end
