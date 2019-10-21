class Photo < ApplicationRecord

  belongs_to :user
  validates :image, :title, presence: true

  # mount_uploader :image, ImageUploader
  
end
