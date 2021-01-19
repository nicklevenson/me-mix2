class FollowRelationshipsController < ApplicationController
  def create
    FollowRelationship.create(follow_params)
    redirect_to user_mixes_path(User.find(params[:follow_relationship][:followed_id]))
  end

  def destroy
  end

  private

  def follow_params
    params.require(:follow_relationship).permit(:follower_id, :followed_id)
  end
end
