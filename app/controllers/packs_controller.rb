class PacksController < ApplicationController

  def create
    logged_in?
    @pack = Pack.new(pack_params)
    @pack.name = "My #{pack_params[:location_name]} Starter Pack"
    @pack.temp_f = WeatherAdapter.get_temp(pack_params[:location_name]).to_i
    @pack.weather_desc = WeatherAdapter.get_description(pack_params[:location_name])
    @pack.user = User.find(session[:user_id])  # This is just so the user persists while we don't have authentication setup
    @pack.save
    redirect_to edit_pack_path(@pack)
  end

  def show
    logged_in?
    find_pack
    @user = @pack.user
    # @user instance may need to change w/ authentication
  end

  def edit
    logged_in?
    find_pack
    @user_selections = @pack.get_items_to_display(@pack.temp_f, @pack.weather_desc)
  end

  def update
    logged_in?
    find_pack
    @pack.update(pack_params)
    item_ids = params[:pack][:item_ids]
    item_ids.each do |item_id|
      item = Item.find_by(id: item_id)
      @pack.items << item unless item == nil
    end
    redirect_to pack_path(@pack)
  end

  def destroy
    find_pack
    @user = @pack.user
    # @user instance may need to change w/ authentication
    @pack.destroy
    redirect_to user_path(@user)
  end

  private

  def pack_params
    params.require(:pack).permit(:name,:location_name,:item_ids) #put ids in here
  end

  def find_pack
    @pack = Pack.find_by(id:params[:id])
  end

  private
  def logged_in?
    return head(:forbidden) unless session.include? :user_id
  end

end
