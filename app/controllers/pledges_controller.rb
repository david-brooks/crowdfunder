class PledgesController < ApplicationController
  before_action :find_project
  before_action :find_reward

	
  def new
  	@pledge = @project.pledges.new
  end

  def create
	@pledge = @project.pledges.build(pledge_params)
	if @pledge.save
		flash[:success] = "Thank you for funding us!"
		redirect_to @project
	else
		render :new
	end
  end

  def destroy
  	@pledge = @project.pledges.find(params[:id])
  	if @pledge.destroy
  		flash[:alert] = "You deleted your pledge!"
  		redirect_to @project
  	end
  end
  private
  def pledge_params
  	params.require(:pledge).permit(:amount)
  end

  def find_project
  	@project = Project.find(params[:project_id])
  end

  def find_reward
  	@reward = find_project.rewards.find(params[:reward_id])
  	return @reward
  end
end