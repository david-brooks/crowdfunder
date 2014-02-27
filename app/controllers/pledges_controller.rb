class PledgesController < ApplicationController
  before_action :find_reward
  before_action :find_project

  def new
  	@pledge = @project.pledges.new
  end

  def create
	@pledge = @reward.pledges.build
  @pledge.amount = @reward.amount
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
  	@project = @reward.project
  end

  def find_reward
    @reward = Reward.find(params[:reward_id])
  end
end