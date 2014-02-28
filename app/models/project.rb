class Project < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :rewards
	has_many :pledges, through: :rewards
	has_many :backers, through: :pledges, source: :user
	validates :title, presence: true, length: {minimum: 10}
	validates :description, presence: true
	validates :goal, presence: true, numericality: {only_integer: true}
	mount_uploader :image, ImageUploader

	acts_as_taggable

	def categories
		["Art","Comics","Dance","Design","Fashion","Film & Video","Food","Games","Music","Photography","Publishing","Technology","Theater"]
	end

	def amount_raised
		"$#{pledges.sum(:amount)}"
	end
end
