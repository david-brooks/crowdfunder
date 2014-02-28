class ProjectsController < ApplicationController
	before_action :signed_in?, only: [:new,:create,:destroy,:edit,:update]

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:success] = "You created a new project"
			redirect_to @project
		else
			render :new			
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			flash[:success] = "You updated your info!"
			redirect_to @project
		else
			render :edit
		end
	end

	def show
		@project = Project.find(params[:id])
		@rewards = @project.rewards
		@pledge = @project.pledges.build
	end

	def index
<<<<<<< HEAD
		if params[:tag]
			@projects = Project.tagged_with(params[:tag])
=======
		if (params[:category_id])
			@category = Category.find(params[:category_id])
			@projects = @category.projects
>>>>>>> ajax_categories
		else
			@projects = Project.all
		end
	end

	def destroy
		Project.find(params[:id]).destroy
		flash[:notice] = "You delete your project!"
		redirect_to root_url
	end

	private
	def project_params
<<<<<<< HEAD
		params.require(:project).permit(:title, :description, :goal, :category, :start_date, :end_date, :image, :remote_image_url, :tag_list)
=======
		params.require(:project).permit(:title,:description,:goal,:start_date,:end_date,:image,:category_id)
>>>>>>> ajax_categories
	end

end