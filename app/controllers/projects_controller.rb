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
		@projects = Project.all
	end

	def destroy
		Project.find(params[:id]).destroy
		flash[:notice] = "You delete your project!"
		redirect_to root_url
	end

	private
	def project_params
		params.require(:project).permit(:title,:description,:goal,:start_date,:end_date,:image,:category_id)
	end

end