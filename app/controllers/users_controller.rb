class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])

    render_404 unless @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Successfully saved user"
      redirect_to users_path
    else
      render :new
    end

  end

  private

  def user_params
    return params.require(:user).permit(:name)
  end
end