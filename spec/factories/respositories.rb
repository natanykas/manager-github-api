# frozen_string_literal: true

FactoryBot.define do
  factory :repository do
    user
    star { 0 }
    name { bdd_course }
  end
end
