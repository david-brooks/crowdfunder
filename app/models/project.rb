class Project < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :rewards
	has_many :pledges, through: :rewards
	has_many :backers, through: :pledges, source: :user
	validates :title, presence: true, length: {minimum: 10}

	def amount_raised
		"$#{rewards.sum(:amount)}"
	end
end
