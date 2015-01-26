class AddMatchToGame < ActiveRecord::Migration
  def change
    add_reference :games, :match, index: true
  end
end
