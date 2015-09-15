require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it "has a valid factory"  do
  	expect(build(:schedule)).to be_valid
  end

  it "is invalid without order" do
		schedule = build(:schedule, order: nil)
		schedule.valid?
  	expect(schedule.errors[:order]).to include("can't be blank")
  end

  it "is invalid without start time" do
		schedule = build(:schedule, start: nil)
		schedule.valid?
  	expect(schedule.errors[:start]).to include("can't be blank")
  end

	it "is invalid with wrong order" do
		schedule = build(:schedule, order: 9)
		schedule.valid?
  	expect(schedule.errors[:order]).to include("order out of range")
  end  

	it "is invalid with nonunique order" do
		schedule = create(:schedule, order: 6)
		schedule1 = build(:schedule, order: 6)
		schedule1.valid?
  	expect(schedule1.errors[:order]).to include("has already been taken")
  end    

end
