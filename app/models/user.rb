class User < ActiveRecord::Base
	has_secure_password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive:false}, format: {with: VALID_EMAIL_REGEX}
	validates :password, length: {minimum:6}
	validates :first_name, presence: true
	validates :last_name, presence: true

end
