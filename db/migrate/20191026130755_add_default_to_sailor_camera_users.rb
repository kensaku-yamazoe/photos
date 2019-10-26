class AddDefaultToSailorCameraUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :camera, "0"
    change_column_default :users, :lens, "0"
    change_column_default :users, :url, ""
  end
end
