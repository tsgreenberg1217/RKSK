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
    @pack = Pack.find_by(id: params[:id])
  end

  def edit
    @pack = Pack.find_by(id:params[:id])
    @user_selections = @pack.get_items_to_display(@pack.temp_f, @pack.weather_desc)
    #come back to disassociate
  end

  def update
    @pack = Pack.find_by(id:params[:id])
    item_ids = params[:pack][:item_ids]
    item_ids.each do |item_id|
      item = Item.find_by(id: item_id)
      @pack.items << item unless item == nil
    end
    redirect_to pack_path(@pack)
  end

  private

  def pack_params
    params.require(:pack).permit(:location_name,:item_ids) #put ids in here
  end

end
