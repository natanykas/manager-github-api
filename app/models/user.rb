# frozen_string_literal: true

class User < ApplicationRecord
  has_many :repositories

  validates :name, presence: true
end
