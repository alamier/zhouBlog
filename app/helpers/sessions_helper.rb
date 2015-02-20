module SessionsHelper
  def zlog_in(user)
    session[:user_id] = user.id
  end

  def zcurrent_user
    @current_user ||= User.find_by(id:session[:user_id])
  end

  def zlogged_in?
    !zcurrent_user.nil?
  end

  def zlog_out
    session.delete(:user_id)
    @current_user = nil
  end

  def zlogged_in_user
    unless zlogged_in?
      redirect_to login_path
    end
  end
end
