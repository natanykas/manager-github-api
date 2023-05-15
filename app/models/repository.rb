class Repository < ApplicationRecord
  belongs_to :user

  validates :star, :name, presence: true
  
  accepts_nested_attributes_for :user

  def self.update_or_create_by(args, attributes)
    obj = self.find_or_create_by(args)
    obj.update(attributes)
    return obj
  end
end
