class SecretsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]

	def index
		@secrets = Secret.all
	end

	def create 
		Secret.create(secret_params)
		redirect_to :back
	end

	def destroy
		secret = Secret.find(params[:id])
		secret.desttroy if secret.user == current_user
		redirect_to :back
	end

	private
		def secret_params
			params.require(:secret).permit(:conten, :user_id)
		end

end
