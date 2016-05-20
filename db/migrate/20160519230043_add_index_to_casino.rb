class AddIndexToCasino < ActiveRecord::Migration
  def change
    add_index(:casinos, :singleton_guard, :unique => true)
  end
end
