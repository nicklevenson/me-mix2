class Content < ApplicationRecord
  has_many :mix_contents
  has_many :mix_content_notes
  has_many :mixes, through: :mix_contents
end
