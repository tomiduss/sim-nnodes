class AddIntervalToCasino < ActiveRecord::Migration
  def change
    add_column :casinos, :interval, :integer
  end
end
