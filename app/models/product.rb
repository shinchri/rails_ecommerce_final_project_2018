class Product < ApplicationRecord
  belongs_to :level
  belongs_to :type
  has_many :order_items

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
