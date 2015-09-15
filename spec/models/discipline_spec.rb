require 'rails_helper'

RSpec.describe Discipline, type: :model do
  it 'has a valid faktory' do
  	expect(build(:discipline)).to be_valid
  end
  it 'is invalid without name' do
  	dis = build(:discipline, name: nil)
  	dis.valid?
  	expect(dis.errors[:name]).to include("can't be blank")
  end
  it 'is invalid with nonunique name' do
  	dis1 = create(:discipline)
  	dis2 = build(:discipline, name: dis1.name)
  	dis2.valid?
  	expect(dis2.errors[:name]).to include("has already been taken")
  end
end
