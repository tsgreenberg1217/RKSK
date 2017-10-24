class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
    @pack.new
    redirect_to new_pack_path
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
