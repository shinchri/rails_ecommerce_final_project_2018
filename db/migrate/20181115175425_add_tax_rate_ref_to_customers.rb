class AddTaxRateRefToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :tax_rate, foreign_key: true
  end
end
