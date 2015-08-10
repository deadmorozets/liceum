require 'rails_helper'

RSpec.describe Role, type: :model do
  it "has a valid factory" do
  	expect(build(:role)).to be_valid
  end
  it "shouldn't be valid with ununiquiness name" do
  	role = create(:role)
  	role2 = build(:role, name: role.name)
  	role2.valid?
  	expect(role2.errors[:name]).to include("has already been taken")
  end
end
