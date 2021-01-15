class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :mix
  # has_rich_text :content

  after_create_commit {broadcast_prepend_to "#{mix.id}comments", target: "#{mix.id}comments"}
  after_update_commit {broadcast_replace_to "#{mix.id}comments"}
  after_destroy_commit {broadcast_remove_to "#{mix.id}comments"}
end
