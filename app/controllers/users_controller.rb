class UsersController < ApplicationController

  def show
    # @photos= Photo.all

    @user = User.find(current_user.id)
    # @photos = @user.image
    # binding.pry
    @photos = Photo.find_by(params[:user_id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to controller: 'users', action: 'show', id: current_user.id
    else
      render "users/#{current_user}"
    end
  end

  private

  def user_params

    params.require(:user).permit(:name, :image, :email, :camera, :lens, :url)
    
    end

end
