class Product < ApplicationRecord
	self.table_name = "products"
	# has_and_belongs_to_many :orders
	has_one_attached :image
end
