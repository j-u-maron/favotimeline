class ToppagesController < ApplicationController
  def index
    if logged_in?
      @recommended = current_user.recommendeds.build
      @recommendeds = current_user.feed_recommendeds.order(id: :desc).page(params[:page])
    end
  end
  
  def Recommended.search(search)
    Recommended.where(["tag LIKE?", "%#{search}%"])
  end
  
  def search
    @recommendeds = Recommended.search(params[:search])
    @recommendeds = @recommendeds.page(params[:page])
  end
end
