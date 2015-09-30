class Game < ActiveRecord::Base
	belongs_to :match
	validates :player1_points, :player2_points ,presence: true
	validate :different_score

	def winner
		player_number = self.player1_points > self.player2_points ? "1" : "2"
		player_id = self.match["player" +  player_number + "_id"]
		
		Player.find(player_id)
	end

	def Game.idd
		puts "22"
	end

	def different_score
		errors.add("", "cannot end in a tie") if player1_points == player2_points
	end
end
