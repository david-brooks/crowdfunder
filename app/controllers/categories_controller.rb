class CategoriesController < ApplicationController
	
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "You created a new category!"
			redirect_to categories_url
		else
			render :new
		end
	end

	def index
		@categories = Category.all
	end

	private
	def category_params
		params.require(:category).permit(:category_name)
	end
end