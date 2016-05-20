class AddRainForecastToCasino < ActiveRecord::Migration
  def change
    add_column :casinos, :rain_forecast, :boolean
  end
end
