class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:block_id])
    current_user.block(user)
    flash[:success] = "ユーザをブロックしました。"
    redirect_to user
  end

  def destroy
    user = User.find(params[:block_id])
    current_user.unblock(user)
    flash[:success] = "ブロックを解除しました。"
    redirect_to user
  end
end
