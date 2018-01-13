class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def sign_out
    cookies.delete(:user_remember_token)
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
  end
end
