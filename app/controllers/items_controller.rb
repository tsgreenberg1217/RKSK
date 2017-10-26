class ItemsController < ApplicationController
  def destroy
    byebug
    @item = Item.find(params[:id]).destroy
    redirect_to items_path
  end
end
