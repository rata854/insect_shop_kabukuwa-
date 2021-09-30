class RenameItemIdColumnToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_products, :item_id, :product_id
  end
end
