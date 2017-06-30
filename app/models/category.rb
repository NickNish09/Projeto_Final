class Category < ApplicationRecord
	has_many :protegories
	has_many :products, through: :protegories
end
