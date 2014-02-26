class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Your account has been created"
			redirect_to @user
		else
			render :new
		end
	end

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "You've succesfully updated your profile!"
			redirect_to @user
		else
			render :edit
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:alert] = "You destroyed a user!"
		redirect_to users_path
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
	end
end