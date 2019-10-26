class UsersController < ApplicationController

  def show
    @camera = [['登録なし',0],['canon',1], ['nikon', 2], ['sony', 3],['fujifilm', 4],['pentax', 5],['スマホ', 6],['その他', 7]]
    @lens = [['登録なし',0],['~14mm　超広角',1], ['16~28mm　[広角]', 2], ['35~60mm　[標準]', 3],['80~100mm　[中望遠]', 4],['100mm~　[望遠]', 5],['その他', 6]]

    @user = User.find(current_user.id)

    # 他のユーザーの詳細ページが観れる
    @photos = Photo.where(["user_id = ?", params[:id]])
    # 自分の写真が見れるだけ
    # @photos = Photo.where(["user_id = ?", current_user.id])

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
