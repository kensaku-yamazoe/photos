class Image < ApplicationRecord

  belongs_to :photo

  validates :image, presence: true

  # 下記ImageUploader用の追記
  # assetcompile errorが出てた。データベース上のファイル名がおかしかった
  mount_uploader :image, ImageUploader
  
end
