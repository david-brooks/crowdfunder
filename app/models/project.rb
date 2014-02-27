class Project < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :rewards
	has_many :pledges, through: :rewards
	has_many :backers, through: :pledges, source: :user
	validates :title, presence: true, length: {minimum: 10}
	validates :description, presence: true
	validates :goal, presence: true, numericality: {only_integer: true}

	mount_uploader :image, ImageUploader

	def amount_raised
		"$#{pledges.sum(:amount)}"
	end
end
