class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @pack = Pack.new
  end
end
