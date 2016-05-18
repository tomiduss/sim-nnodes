class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :player_id
      t.integer :round_id

      t.integer :amount
      t.string :color

      t.timestamps null: false
    end
  end
end
