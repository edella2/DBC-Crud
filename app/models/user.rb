class User < ActiveRecord::Base
	validates :username, :email, :password_hash, presence: true
	validates :email, uniqueness: true
	has_many :templates


	include BCrypt

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

end
