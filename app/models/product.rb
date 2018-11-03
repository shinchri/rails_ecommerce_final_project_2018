class Product < ApplicationRecord
  belongs_to :level
  belongs_to :type
  has_many :order_items
end
