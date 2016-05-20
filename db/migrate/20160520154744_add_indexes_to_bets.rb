class AddIndexesToBets < ActiveRecord::Migration
  def change
    add_index :bets, :round_id
    add_index :bets, :player_id
  end
end
