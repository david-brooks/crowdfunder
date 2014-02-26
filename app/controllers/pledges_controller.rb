class PledgesController < ApplicationController
  before_action :find_project
  before_action :find_reward, only: :create

  def new
  	@pledge = @project.pledges.new
  end

  def create
	@pledge = @project.pledges.build(pledge_params)
	respond_to do |format|
		if @pledge.save
			format.html {redirect_to project_path(@project), notice: 'Thanks for the ched!'}
			format.js
		else
			format.html {render 'projects/show', alert: "There was an error"}
			format.js
		end
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
  	@reward = Project.reward.find(params[:id])
  end
end