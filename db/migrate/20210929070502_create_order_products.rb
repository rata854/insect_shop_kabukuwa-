class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.integer :order_id
      t.integer :item_id
      t.integer :master_price
      t.integer :production_status, default: 0, null: false

      t.timestamps
    end
  end
end
