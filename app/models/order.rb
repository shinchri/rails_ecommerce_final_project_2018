# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :order_status
  has_many :order_items, dependent: :destroy

  validates :customer_id, presence: true
  validates :order_status_id, presence: true
  validates :total, presence: true
  validates :total_tax, presence: true
end
