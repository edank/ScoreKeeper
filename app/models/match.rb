class Match < ActiveRecord::Base
	has_many :games
	validates :p1ayer1_id, :player2_id ,presence: true
end
