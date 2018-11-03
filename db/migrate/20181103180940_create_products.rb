class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :level, foreign_key: true
      t.references :type, foreign_key: true
      t.decimal :price
      t.text :image

      t.timestamps
    end
  end
end
