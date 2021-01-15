class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
  end

  def destroy

  end
  private

  def comment_params
    
  end

end
