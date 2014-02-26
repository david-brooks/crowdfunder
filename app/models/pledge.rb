class Pledge < ActiveRecord::Base
	belongs_to :project
	belongs_to :user 
	belongs_to :reward

	validates :reward_id, presence: true

	def reward_amount
		project.rewards.each{|r| r.amount}
	end
end
