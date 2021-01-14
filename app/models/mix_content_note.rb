class MixContentNote < ApplicationRecord
  belongs_to :mix 
  belongs_to :content
end
