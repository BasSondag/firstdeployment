class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def new
  end 

  def edit
    @user = User.find(session[:user_id])
  end

	def show
      @user = User.find(session[:user_id])
      @secrets =	User.find(session[:user_id]).secrets
      @liked = User.find(current_user.id).secret_liked

	end

  def create
   @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      flash[:success]
      redirect_to "/users/#{session[:user_id]}"
     else 
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end 
  end

	private
	 def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
