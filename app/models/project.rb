class Project < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :rewards
	has_many :pledges
	validates :title, presence: true, length: {minimum: 10}
end
