require 'faker'

FactoryGirl.define do
  factory :discipline do
    name {Faker::Company.name}
  end

end
