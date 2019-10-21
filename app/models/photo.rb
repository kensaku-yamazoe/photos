class Photo < ApplicationRecord

  belongs_to :user
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images

  validates :title, presence: true


  # mount_uploader :image, ImageUploader
  
end
