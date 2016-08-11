class Order < ApplicationRecord
	has_one :address
	has_one :order
	has_many :order_additionals
end
