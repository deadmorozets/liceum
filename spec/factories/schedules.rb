
FactoryGirl.define do
  factory :schedule do
    order { Faker::Number.between(0, 8) }
		start { Faker::Time.forward(30) }
  end

end
