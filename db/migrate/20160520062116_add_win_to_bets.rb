class AddWinToBets < ActiveRecord::Migration
  def change
    add_column :bets, :win, :boolean
  end
end
