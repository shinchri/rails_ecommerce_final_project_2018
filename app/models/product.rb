# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :level
  belongs_to :type
  has_many :order_items

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true

  mount_uploader :image, ImageUploader

  paginates_per 10

  # trying filtering
  scope :is_new, -> (is_new) {where is_new: is_new}
  scope :on_sale, -> (on_sale) {where on_sale: on_sale}
end
