class Schedule < ActiveRecord::Base
	has_many :lessons
	validates :order, presence: true, format: { with: /\A[0-8]/, message: "order out of range" },
										uniqueness: true
	validates :start, presence: true
end
