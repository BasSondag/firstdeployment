class LikesController < ApplicationController
  def create()
  	Like.create(user_id:session[:user_id], secret_id:params[:liked][:user_id])
  	redirect_to "/secrets"
  end

  def destroy
  	like = Like.where(user_id: User.find(session[:user_id]), secret_id: params[:id]).first
  	like.destroy
   	redirect_to "/secrets"
  end
end
