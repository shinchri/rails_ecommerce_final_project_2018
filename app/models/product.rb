class Product < ApplicationRecord
  belongs_to :level
  belongs_to :type
end
