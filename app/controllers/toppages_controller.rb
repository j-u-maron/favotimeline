class ToppagesController < ApplicationController
  def index
    if logged_in?
      @recommended = current_user.recommendeds.build
      @recommendeds = current_user.recommendeds.order(id: :desc).page(params[:page])
    end
  end
end
