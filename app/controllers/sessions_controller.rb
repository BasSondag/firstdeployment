class SessionsController < ApplicationController

	def new
	end

	def create
		puts params[:email]
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			@user = session[:user_id]
			redirect_to "/users/#{@user}"
		else 
			flash[:errors] = ['Invalid password or email']	
			redirect_to "/sessions/new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/sessions/new'
	end

end
