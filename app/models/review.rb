class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :game

	has_many :votes
	
	validates :rating, :presence => true,
					   :numericality => {:greater_than_or_equal_to => 0,
					   					 :less_than_or_equal_to => 5}

	validates :title, :presence => true,
					  :length => {:maximum => 50}

end
