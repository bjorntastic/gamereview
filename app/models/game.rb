class Game < ActiveRecord::Base

	has_many :reviews

	def to_s
		"#{name}"
	end

end
