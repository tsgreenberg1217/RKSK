class PacksController < ApplicationController
  def new
    @pack = Pack.new
  end

  def create

    byebug
    @pack = Pack.new(pack_params)
    WeatherAdapter.get_temp(pack_params)
    redirect_to pack_path(@pack)
  end

  def pack_params
    params.require(:pack).permit(:location_name)
  end
end
