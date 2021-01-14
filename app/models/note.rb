class Note < ApplicationRecord
  belongs_to :mix
  belongs_to :content
end
