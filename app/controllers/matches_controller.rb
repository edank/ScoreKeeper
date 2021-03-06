class MatchesController < ApplicationController

	def index
		@matches = Match.all.order(id: :desc)
	end

	def new
		@match = Match.new
		5.times {@match.games.build} #defining max 5 games for now
	end

	def show
		@match = Match.find(params[:id])
		# TODO: change id to Player object?
		@p1 = Player.find(@match.player1_id)
		@p2 = Player.find(@match.player2_id)
	end

	# Called when Post to /macthes
	def create
		# render plain: match_params
		# create new match
		@match = Match.new(match_params)
		if (@match.save)
			redirect_to matches_path
		else
			render 'new'
		end
	end


	private
	def match_params
		params.require(:match).permit(:player1_id, :player2_id, games_attributes: [:player1_points, :player2_points])
	end

end
