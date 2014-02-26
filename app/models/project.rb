class Project < ActiveRecord::Base
	belongs_to :user
	has_many :rewards
	has_many :backers, through: :pledges, source: :user
	validates :title, presence: true, length: {minimum: 10}
end
