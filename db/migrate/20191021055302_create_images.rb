class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|

      t.references :photo, null: false, foreign_key: { to_table: :photos }
      t.string :image, null: false 

      t.timestamps
    end
  end
end
