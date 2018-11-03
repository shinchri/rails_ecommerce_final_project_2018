class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :price, presence: true
  validates :quantity, numericality: { only_integer: true}
end
