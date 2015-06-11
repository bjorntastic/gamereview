class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :game
	
	validates :rating, :presence => true,
					   :inclusion => {:within => 0..5}

	validates :title, :presence => true,
					  :length => {:maximum => 50}

end
