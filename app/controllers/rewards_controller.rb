class RewardsController < ApplicationController
	before_action :find_project
	before_action :get_reward, only: [:edit,:update,:destroy]
	
	def new
		@reward = @project.rewards.new
	end

	def create
		@reward = @project.rewards.build(reward_params)
		if @reward.save
			flash[:success] = "You have placed rewards into your project!"
			redirect_to @project
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @reward.update_attributes(reward_params)
			flash[:success] = "You've updated your rewards info!"
			redirect_to @project
		else
			render :edit
		end
	end

	def destroy
		if @reward.destroy
			flash[:notice] = "You destroyed one of your rewards"
			redirect_to @project
		end
	end

	private
	def reward_params
		params.require(:reward).permit(:amount,:description)
	end

	def find_project
		@project = Project.find(params[:project_id])
	end

	def get_reward
		@reward = @project.rewards.find(params[:id])
	end
end