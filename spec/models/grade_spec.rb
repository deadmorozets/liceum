require 'spec_helper'

RSpec.describe Grade, type: :model do
  describe Grade do
  	it 'has a valid factory' do
  		expect(build(:grade)).to be_valid
  	end
  	it 'is invalid without grade' do
  		grade = build(:grade, name: nil)
  		grade.valid?
  		expect(grade.errors[:name]).to include("can't be blank")
  	end

  	context 'non-matching grades' do
  		it 'is invalid with invalid grade' do
  			grade = build(:grade, name: '01а')
	  		grade.valid?
	  		expect(grade.errors[:name]).to include("Invalid format of grade name")
  		end
  		it 'is invalid with invalid grade2' do
  			grade = build(:grade, name: '20б')
	  		grade.valid?
	  		expect(grade.errors[:name]).to include("Invalid format of grade name")
  		end
  		it 'is invalid with invalid grade3' do
  			grade = build(:grade, name: '13в')
	  		grade.valid?
	  		expect(grade.errors[:name]).to include("Invalid format of grade name")
  		end
  		it 'is invalid with invalid grade4' do
  			grade = build(:grade, name: '7д')
	  		grade.valid?
	  		expect(grade.errors[:name]).to include("Invalid format of grade name")
  		end
  		it 'is invalid with invalid grade5' do
  			grade = build(:grade, name: '0г')
	  		grade.valid?
	  		expect(grade.errors[:name]).to include("Invalid format of grade name")
  		end
      it 'is invalid with nonunique name' do
        grade = create(:grade, name: '5а')
        grade1 = build(:grade, name: '5а')
        grade1.valid?
        expect(grade1.errors[:name]).to include('has already been taken')
      end
  	end
  end
end
