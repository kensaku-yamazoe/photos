class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|

      t.references :user, foreign_key: true
      t.string  :title, null: false
      t.integer :genre, default: 0
      t.integer :camera, default: 0
      t.integer :lens, default: 0
      t.text    :text
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
