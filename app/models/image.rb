class Image < ApplicationRecord

  belongs_to :photo

  # 下記ImageUploader用の追記　
  # assetcompile errorが出てた。データベース上のファイル名がおかしかった
  mount_uploader :image, ImageUploader
  
end
