require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user, class: User do
    user_name {Faker::Name.first_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(8)}
  end
end