class UsersController < ApplicationController
  def show

    logged_in?
    @user = User.find_by(id: params[:id])
    @pack = Pack.new
    @packs = @user.packs.order('name')
    # the last line will put the packs in alpha order
  end


  def new
    #goes to empty form
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  private
  def logged_in?
    return head(:forbidden) unless session.include? :user_id
  end

end
