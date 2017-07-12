class ProtegoriesController < ApplicationController
	

	def create
		@protegory = Protegory.new(product_id: params[:pro_id],category_id: params[:cat_id])
		@protegory.save
		redirect_to :back
	end

	def destroy
		@protegory = Protegory.find_by category_id: params[:cat_id],product_id: params[:pro_id]
		@protegory.destroy
		redirect_to :back
	end

end
