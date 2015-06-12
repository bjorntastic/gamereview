class User < ActiveRecord::Base

	has_many :reviews

	validates :username, :presence => true,
						 :uniqueness => true,
						 :length => {:minimum => 5,
						 			 :masimum => 30}
	validates :password_digest, :presence => true

	has_secure_password
	
	def to_s
		"#{username}"
	end
	
end
