class TaxRate < ApplicationRecord
  has_many :customers

  validates :province_name, presence: true, uniqueness: true
  validates :pst, presence: true
  validates :gst, presence: true
end
