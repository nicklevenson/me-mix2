class Content < ApplicationRecord
  has_many :mix_contents
  has_many :notes
  has_many :mixes, through: :mix_contents

  accepts_nested_attributes_for :notes
end
