require 'faker'

FactoryGirl.define do
  factory :passenger do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
  end
end