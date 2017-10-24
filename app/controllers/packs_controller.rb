class PacksController < ApplicationController
  def new
    @pack = Pack.new
  end

  def create
    @pack = Pack.new(pack_params)
    @pack.name = "My #{pack_params[:location_name]} Starter Pack"
    @pack.temp_f = WeatherAdapter.get_temp(pack_params[:location_name]).to_i
    @pack.weather_desc = WeatherAdapter.get_description(pack_params[:location_name])
    @pack.user = User.find(1)  # This is just so the user persists while we don't have authentication setup
    @pack.save
    redirect_to edit_pack_path(@pack)
  end

  def show
    #code
  end

  def edit
    @pack = Pack.find_by(id:params[:id])
    @pack.get_items_to_display(@pack.temp_f, @pack.weather_desc)
    # redirect_to pack_path(@pack)
  end

  private

  def pack_params
    params.require(:pack).permit(:location_name)
  end

end
