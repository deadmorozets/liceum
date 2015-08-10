require 'spec_helper'

describe User do
	it 'has a valid factory' do
		expect(build(:user)).to be_valid
	end
	it 'is valid with firstname, lastname, email and password' do
		user = User.new(
			last_name: 'Пупкин',
			first_name: 'Вася',
			email: 'vasya@mail.com',
			password: '123123123',
			sign_in_count: 0)
		expect(user).to be_valid
	end
	it 'is invalid without firstname' do
		user = build(:user, first_name: nil)
		user.valid?
		expect(user.errors[:first_name]).to include("can't be blank")
	end
	it 'is invalid without lastname' do
		user = build(:user, last_name: nil)
		user.valid?
		expect(user.errors[:last_name]).to include("can't be blank")
	end
	it 'is invalid without email' do
		user = build(:user, email: nil)
		user.valid?
		expect(user.errors[:email]).to include("can't be blank")
	end
	it 'is invalid with duplicate email' do
		User.create(
			last_name: 'Пупкин',
			first_name: 'Вася',
			email: 'vasya@mail.com',
			password: '123123123',
			sign_in_count: 0)
		user = User.new(
			last_name: 'Жуков',
			first_name: 'Вася',
			email: 'vasya@mail.com',
			password: '123123123',
			sign_in_count: 0)
		expect(user).to_not be_valid
	end
	it 'is invalid without password' do
		user = build(:user, password: nil)
		user.valid?
		expect(user.errors[:password]).to include("can't be blank")
	end
	it 'is invalid with password shorter than 8 characters' do
		expect(build(:user, password: '1231233')).to_not be_valid
	end
	it "returns user's full name as a string" do
		expect(build(:user, first_name: 'Вася', last_name: 'Пупкин').full_name).to eq 'Пупкин Вася'
	end
	it 'has any role' do	
		expect(create(:user).has_any_role?).to eq true
	end	
end