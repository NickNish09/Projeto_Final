class Product < ApplicationRecord
	has_many :protegories
	has_many :categories, through: :protegories
	#searchable do
    #	text :name, :description
	#end
	def self.search(search)
	  where("name ILIKE ?", "%#{search}%") 
	  #where("content LIKE ?", "%#{search}%")
	end
end
