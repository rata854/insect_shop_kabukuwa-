class ChangeItemsToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :items, :products
  end
end
