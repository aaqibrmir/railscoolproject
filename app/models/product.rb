class Product < ApplicationRecord
	belongs_to :category
	has_many :orders
	has_one_attached :image
	validates :name, presence: true
	validates :price, presence: true
end
