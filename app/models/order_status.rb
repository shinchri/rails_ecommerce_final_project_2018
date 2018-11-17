class OrderStatus < ApplicationRecord
  has_many :orders

  validates :status, presence: true
end
