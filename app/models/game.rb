class Game < ActiveRecord::Base
	belongs_to :match
	validates :player1_points, :player2_points ,presence: true

	def winner
		player_number = self.player1_points > self.player2_points ? "1" : "2"
		player_id = self.match["player" +  player_number + "_id"]
		
		Player.find(player_id)
	end

	def Game.idd
		puts "22"
	end


end
