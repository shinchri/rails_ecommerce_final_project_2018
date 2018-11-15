class ChangeProductTable < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :image, :string
    add_column :products, :on_sale, :boolean
    add_column :products, :is_new, :boolean
  end
end
