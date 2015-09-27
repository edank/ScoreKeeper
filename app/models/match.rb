class Match < ActiveRecord::Base
	has_many :games
	validates :player1_id, :player2_id ,presence: true
	validates_associated :games
	validate :different_players
	
	accepts_nested_attributes_for :games, reject_if: lambda { |att| att['player1_points'].blank? || att['player2_points'].blank?  } #creates games_attributes

	def p1_game_wins()
		game_wins(1)
	end

	def p2_game_wins()
		game_wins(2)
	end
	
	def winner()
		p1_game_wins > p2_game_wins ? Player.find(player1_id) : Player.find(player2_id)
	end

	private

	def different_players
		errors.add(" ", "Players cannot be the same person") if player1_id == player2_id
	end

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
