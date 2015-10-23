FactoryGirl.define do
  factory :feedback do
  	name {Faker::Name.first_name}
    email {Faker::Internet.email}
    subject {Faker::Lorem.sentence}
    content {Faker::Lorem.sentences}
  end



end
