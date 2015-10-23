require 'factory_girl'
require 'faker'

FactoryGirl.define do
  
  factory :library, class: Library do |l|
    l.topic {Faker::Lorem.word}
    l.description {Faker::Lorem.sentence}
    l.public true
  end

  factory :private_library, parent: :library do |l|
  	l.public false
  end

  factory :invalid_library, parent: :library do
  	topic nil
  	to_create {|instance| instance.save(validate: false) }
  end
end