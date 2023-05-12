class User < ApplicationRecord
    has_many :repositories
    
    validates :name, presence: true
end
