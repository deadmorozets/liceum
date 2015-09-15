class Discipline < ActiveRecord::Base
	has_many :lessons
	validates :name, presence: true, uniqueness: true
end
