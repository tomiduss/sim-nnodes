class AddWeatherDateToCasino < ActiveRecord::Migration
  def change
    add_column :casinos, :weather_date, :datetime
  end
end
