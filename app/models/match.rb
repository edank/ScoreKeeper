class Match < ActiveRecord::Base
	has_many :games
	validates :player1_id, :player2_id ,presence: true
	validates_associated :games
	
	accepts_nested_attributes_for :games, reject_if: lambda { |att| att['player1_points'].blank? || att['player2_points'].blank?  } #allow create games when creating a match

	def p1_game_wins()
		game_wins(1)
	end

	def p2_game_wins()
		game_wins(2)
	end
	

	private

	def game_wins(player_number)
		counter = 0
		
		self.games.each do |g| 
			if g.winner.id == player_number
				counter += 1
			end   
		end
		return counter
	end


end
