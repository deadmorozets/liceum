class Grade < ActiveRecord::Base
	has_many :users
	has_many :lessons

	validates :name, presence: true,
										format: { with: /\A(10|11|[1-9])[а-г]/, message: "Invalid format of grade name"},
										uniqueness: true


end
