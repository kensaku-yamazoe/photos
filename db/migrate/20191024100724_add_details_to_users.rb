class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :camera, :integer
    add_column :users, :lens, :integer
    add_column :users, :url, :string
  end
end
