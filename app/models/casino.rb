require 'rest-client'
require 'json'

class Casino < ActiveRecord::Base
  validates_inclusion_of :singleton_guard, :in => [0]

  has_many :rounds

  def self.instance
    begin
      first
    rescue ActiveRecord::RecordNotFound
      row = Casino.new
      row.singleton_guard = 0
      row.money = 10000000
      row.name = 'Nnodes'
      row.status = 'closed'
      row.api_key = '9331b0570a8c1089395e1761cfd7a2f7'
      row.interval = 3
      row.save!
    end
  end

  def self.start
    instance.update(status: "open", last_start: Time.now)
    return true
  end

  def self.stop
    instance.update(status: "closed", last_stop: Time.now)
    return false
  end

  def self.running
    return instance.status == "open" ? true : false
  end

  def self.weather
    return instance.weather
  end

  def self.interval
    return instance.interval
  end

  def self.rain_forecast
    return instance.rain_forecast
  end

  def self.update_weather
    response = JSON.parse(RestClient.get "http://api.openweathermap.org/data/2.5/forecast/city?id=3871336&APPID=9331b0570a8c1089395e1761cfd7a2f7")
    puts response['cod']
    if response['cod'] == "200"

      forecast  = response['list']
      current = forecast[0]['weather'][0]['main']
      puts current
      rain = 0

      forecast.each do |f|
        if f['weather'][0]['main'] == "Rain"
          rain += 1
        end
      end

      rain_forecast = if rain > 0
        true
      else
        false
      end
      instance.update(weather_date: Time.now, weather: current, rain_forecast: rain_forecast )
    else
      puts "No se pudo obtener informacion del clima"
    end

  end


  private_class_method :new

end
