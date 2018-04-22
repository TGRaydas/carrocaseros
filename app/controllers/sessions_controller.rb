class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.where(email: params[:user][:email], password: params[:user][:password]).first
    if user != nil
      session[:current_session_id] = user.id
      redirect_to '/admin'
    else
      redirect_to '/login'
    end
  end
end
