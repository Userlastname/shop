class RemoveQuantityFromCartProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_products, :quantity, :string
  end
end
