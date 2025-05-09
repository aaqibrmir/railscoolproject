class Order < ApplicationRecord
  belongs_to :product
  validates :quantity, presence: true
  validates :total_price, presence: true
end
