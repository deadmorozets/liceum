require 'spec_helper'

RSpec.describe Lesson, type: :model do
  describe Lesson do
  	it 'has a valid factory' do
  		expect(build(:lesson)).to be_valid
  	end
  	it 'is invalid without grade' do
  		lesson = build(:lesson, grade_id: nil)
  		lesson.valid?
  		expect(lesson.errors[:grade_id]).to include("can't be blank")
  	end
    it 'is invalid without schedule' do
      lesson = build(:lesson, schedule_id: nil)
      lesson.valid?
      expect(lesson.errors[:schedule_id]).to include("can't be blank")
    end
    it 'is invalid without discipline' do
      lesson = build(:lesson, discipline_id: nil)
      lesson.valid?
      expect(lesson.errors[:discipline_id]).to include("can't be blank")
    end
    it 'is invalid without lesson date' do
      lesson = build(:lesson, lesson_date: nil)
      lesson.valid?
      expect(lesson.errors[:lesson_date]).to include("can't be blank")
    end
  end
end
