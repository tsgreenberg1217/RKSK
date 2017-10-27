class ItemsController < ApplicationController
  def destroy
    @item = Item.find(params[:id]).destroy
    redirect_to items_path
  end
end
