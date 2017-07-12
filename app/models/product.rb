class Product < ApplicationRecord
	has_many :protegories
	has_many :categories, through: :protegories
	validates :name,presence: true, length: {maximum: 50}
	validates :price,presence: true
	validates :description, presence: true
	def self.search(search)
	  where("name ILIKE ?", "%#{search}%") 
	  #where("content LIKE ?", "%#{search}%")
	end
end
