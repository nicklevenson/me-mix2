class Mix < ApplicationRecord
  belongs_to :user
  has_many :mix_contents
  has_many :contents, through: :mix_contents
  has_many :likes
  has_many :comments
  has_many :notes

  validates :title, presence: true

  accepts_nested_attributes_for :contents
  accepts_nested_attributes_for :notes

  # def notes_attributes=(notes_attributes)
  #   notes_attributes.each do |n|
  #     self.
  #     byebug
  #   end
  # end
end
