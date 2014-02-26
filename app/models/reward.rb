class Reward < ActiveRecord::Base
	has_many :pledges
	has_many :backers, through: :pledges, source: :user
	belongs_to :project
end
