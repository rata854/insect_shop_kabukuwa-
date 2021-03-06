class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
