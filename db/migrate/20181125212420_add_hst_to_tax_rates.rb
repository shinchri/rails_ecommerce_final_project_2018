class AddHstToTaxRates < ActiveRecord::Migration[5.2]
  def change
    add_column :tax_rates, :hst, :decimal
  end
end
