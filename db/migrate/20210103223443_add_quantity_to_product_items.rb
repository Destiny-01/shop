class AddQuantityToProductItems < ActiveRecord::Migration[6.1]
  def change
    add_column :product_items, :quantity, :integer,  default: 1
  end
end
