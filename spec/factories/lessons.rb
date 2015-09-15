require 'faker'

FactoryGirl.define do
  factory :lesson do
    lesson_date { Faker::Date.forward(90) }
    discipline
    schedule
    grade
  end

end