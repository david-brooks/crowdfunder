class User < ActiveRecord::Base
	before_save {email.downcase!}
	before_create :create_remember_token
	has_many :projects, foreign_key: "owner_id"
	has_many :pledges
	has_many :rewards, through: :pledges
	has_secure_password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive:false}, format: {with: VALID_EMAIL_REGEX}
	validates :password, length: {minimum:6}
	validates :first_name, presence: true
	validates :last_name, presence: true

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end

end

