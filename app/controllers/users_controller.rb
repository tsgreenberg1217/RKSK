class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @pack = Pack.new
    @packs = @user.packs.order('name')
    # the last line will put the packs in alpha order
  end


  def new
  end

  def create
  end
end
