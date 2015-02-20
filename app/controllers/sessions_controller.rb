class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      zlog_in user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    zlog_out if zlogged_in?
    redirect_to root_url
  end
end
