class AddWeatherToCasino < ActiveRecord::Migration
  def change
    add_column :casinos, :weather, :string
  end
end
