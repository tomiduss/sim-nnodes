class AddStatusToCasino < ActiveRecord::Migration
  def change
    add_column :casinos, :status, :string
  end
end
