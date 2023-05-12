class Repository < ApplicationRecord
  belongs_to :user

  validates :star, presence: true
  
  accepts_nested_attributes_for :user
end
