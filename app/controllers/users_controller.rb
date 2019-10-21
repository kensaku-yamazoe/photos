class UsersController < ApplicationController

  def show
    # @photos= Photo.all

    @user = User.find(current_user.id)
    # @photos = @user.image
    # binding.pry
    @photos = Photo.find_by(params[:user_id])

  end
  
end
