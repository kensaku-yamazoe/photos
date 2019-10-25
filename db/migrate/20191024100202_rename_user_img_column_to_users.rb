class RenameUserImgColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_img, :image
  end
end
