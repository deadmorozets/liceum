class Lesson < ActiveRecord::Base
	belongs_to :discipline
	belongs_to :grade
	belongs_to :schedule
	validates :discipline_id, presence: true
	validates :grade_id, presence: true
	validates :schedule_id, presence: true
	validates :lesson_date, presence: true
end
