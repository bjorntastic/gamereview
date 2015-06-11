class Game < ActiveRecord::Base

	has_many :reviews

	validates :name, :presence => true,
					 :length => {:within => 3..50},
					 :uniqueness => true

	def to_s
		"#{name}"
	end

end
