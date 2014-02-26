class UsersController < ApplicationController
	before_action :admin_user, only: :destroy
	before_action :signed_in_user, only: [:edit,:destroy,:update]
	before_action :correct_user?, only: [:edit,:update,:destroy]

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
		params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,admin:false)
	end

	def correct_user?
		@user = User.find(params[:id])
		redirect_to root_url, notice: "you can't do that!" unless current_user?(@user)
	end

	def admin_user
		redirect_to root_url unless current_user.admin?
	end
end