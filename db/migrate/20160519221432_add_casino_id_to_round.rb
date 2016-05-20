class AddCasinoIdToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :casino_id, :integer
  end
end
