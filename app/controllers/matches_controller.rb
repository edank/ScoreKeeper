class MatchesController < ApplicationController
	
	def index
		@matches = Match.all
	end

	def new
		@players = Player.all
		@match = Match.new
	end

	def create
		render plain: params
		# create new match
		@match = Match.new(match_params)
		#create new games
		# associate games with match
	end

	private
	def match_params
		params.require(:match).permit(:player1_id, :player2_id)
	end

end
