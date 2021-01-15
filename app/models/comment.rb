class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :mix
  # has_rich_text :content

  after_create_commit {broadcast_prepend_to "comments"}
  after_update_commit {broadcast_replace_to "comments"}
  after_destroy_commit {broadcast_remove_to "comments"}
end
