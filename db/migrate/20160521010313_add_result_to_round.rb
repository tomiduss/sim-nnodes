class AddResultToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :result, :string
  end
end
