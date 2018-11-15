# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :customer_id, presence: true
  validates :total, presence: true
  validates :total_tax, presence: true
end
