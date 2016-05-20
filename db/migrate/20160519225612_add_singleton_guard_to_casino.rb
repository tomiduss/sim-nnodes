class AddSingletonGuardToCasino < ActiveRecord::Migration
  def change
    add_column :casinos, :singleton_guard, :integer
  end
end
