module CommentsHelper
  def delete_comment(comment)
      if current_user == comment.user then button_to "Delete Comment", comment_path(comment), method: :delete end
  end
end
