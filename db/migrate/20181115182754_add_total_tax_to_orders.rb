class AddTotalTaxToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total_tax, :decimal
  end
end
