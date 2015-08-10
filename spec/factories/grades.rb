require 'faker'

FactoryGirl.define do
  factory :grade do
    name { Faker::Number.between(1, 11).to_s + ['а', 'б', 'в', 'г'].sample }
  end

end
