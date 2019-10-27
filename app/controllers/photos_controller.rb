class PhotosController < ApplicationController

  def index
    @photos = Photo.all.order(id: "DESC")
  end

  def genre
  end

  def camera
    @canon = Photo.where(camera: "1")
    @nikon = Photo.where(camera: "2")
    @sony = Photo.where(camera: "3")
    @fujifilm = Photo.where(camera: "4")
    @pentax = Photo.where(camera: "5")
    @smartphone = Photo.where(camera: "6")
    @ext = Photo.where(camera: "7")
  end

  def lens
  end

  def howto
  end
  
  def show
    @genre = [['未分類',0], ['ポートレート', 1], ['風景', 2],['動物', 3],['植物、花', 4],['スナップ', 5],['料理', 6],['テーブルフォト', 7]]
    @camera = [['未分類',0],['canon',1], ['nikon', 2], ['sony', 3],['fujifilm', 4],['pentax', 5],['スマホ', 6],['その他', 7]]
    @lens = [['未分類',0],['~14mm　超広角',1], ['16~28mm　[広角]', 2], ['35~60mm　[標準]', 3],['80~100mm　[中望遠]', 4],['100mm~　[望遠]', 5],['その他', 6]]

    @photos = Photo.find(params[:id])
    @images = @photos.images
    
    # photosテーブルのユーザーの表示
    @user = User.find_by(id: @photos.user_id)
  end

  def new
    @photo = Photo.new
    @photo.images.build
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to '/photos'
    else
      redirect_to '/photos/new'
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :text , :genre, :camera, :lens, images_attributes: [:id, :image], ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
