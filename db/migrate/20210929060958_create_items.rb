class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :genre_id
      t.text :detail
      t.string :image_id
      t.boolean :sales_status, default: false, null: false

      t.timestamps
    end
  end
end
