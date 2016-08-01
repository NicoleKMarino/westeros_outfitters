class AddQuantityToOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :quantity
    add_column :order_items, :quantity, :integer
  end
end
