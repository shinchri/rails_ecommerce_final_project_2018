class CreateTaxRates < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_rates do |t|
      t.string :province_name
      t.decimal :pst
      t.decimal :gst

      t.timestamps
    end
  end
end
