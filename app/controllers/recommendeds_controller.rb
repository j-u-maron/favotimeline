class RecommendedsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @recommended = current_user.recommendeds.build(recommended_params)
    if @recommended.save
      flash[:success] = "投稿しました。"
      redirect_to root_url
    else
      @recommendeds = current_user.recommendeds.order(id: :desc).page(params[:page])
      flash.now[:danger] = "投稿に失敗しました。"
      render "toppages/index"
    end
  end

  def destroy
    @recommended.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def recommended_params
    params.require(:recommended).permit(:content, :tag)
  end
  
  def correct_user
    @recommended = current_user.recommendeds.find_by(id: params[:id])
    unless @recommended
      redirect_to root_url
    end
  end
end
