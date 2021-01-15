class LikesController < ApplicationController
  def create
    params.inspect
    Like.create(like_params)
    byebug
  end

  def destroy

  end

  private

  def like_params
    params.require(:info).permit(:mix_id, :user_id)
  end
end
