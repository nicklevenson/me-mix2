class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
  end

  def destroy

  end
  private

  def comment_params
    params.require(:comment).permit(:mix_id, :content)
  end

end
