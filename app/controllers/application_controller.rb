class ApplicationController < ActionController::Base
  
  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_recommendeds = user.recommendeds.count
    @count_blockings = user.blockings.count
  end
end