class Product < ApplicationRecord
	#searchable do
    #	text :name, :description
	#end
	def self.search(search)
	  where("name ILIKE ?", "%#{search}%") 
	  #where("content LIKE ?", "%#{search}%")
	end
end
