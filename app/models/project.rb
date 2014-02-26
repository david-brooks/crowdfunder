class Project < ActiveRecord::Base
	belongs_to :owner, foreign_key: "owner_id"
	has_many :rewards
	has_many :user_pledges, through: :pledges, source: :user
	validates :title, presence: true, length: {minimum: 10}
end
