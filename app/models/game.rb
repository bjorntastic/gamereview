class Game < ActiveRecord::Base

	has_many :reviews, dependent: :destroy #or :delete_all if no callbacks
	has_many :game_votes, dependent: :destroy

	validates :name, :presence => true,
					 :length => {:within => 3..50},
					 :uniqueness => true

	def to_s
		"#{name}"
	end

end
