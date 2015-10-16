require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :library, class: Library do
    topic {Faker::Lorem.words}
    description {Faker::Lorem.sentence}
  end
end