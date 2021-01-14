class Mix < ApplicationRecord
  belongs_to :user
  has_many :mix_contents
  has_many :contents, through: :mix_contents
  has_many :likes
  has_many :comments

  validates :title, presence: true

  accepts_nested_attributes_for :contents
 
end
