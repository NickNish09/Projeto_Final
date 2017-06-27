class Product < ApplicationRecord
	#has_and_belongs_to_many :categories
	#searchable do
    #	text :name, :description
	#end
	def self.search(search)
	  where("name ILIKE ?", "%#{search}%") 
	  #where("content LIKE ?", "%#{search}%")
	end
end
