class Game < ActiveRecord::Base

	has_many :reviews
	has_many :game_votes

	validates :name, :presence => true,
					 :length => {:within => 3..50},
					 :uniqueness => true

	def to_s
		"#{name}"
	end

end
