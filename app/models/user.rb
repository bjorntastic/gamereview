class User < ActiveRecord::Base

	has_many :reviews

	def to_s
		"#{username}"
	end
	
end
