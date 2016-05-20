namespace :sim do

  desc 'Iniciar simulación'

  task :start => :environment do
    puts 'Inicio ruleta'
    Casino.start
    interval = Casino.instance.interval



    #while Casino.instance.running do
    while Casino.running do
      #Actualizar pronosticos
      Casino.update_weather

      players = Player.with_money

      Round.play_round(players)
      puts "#{Time.now}" + " | Round #{Round.round_number} | Casino Money = #{Casino.instance.money} | Player Count: #{players.count} | Weather: #{Casino.weather} | Rain?: #{Casino.rain_forecast}"

      sleep Casino.interval
    end
    puts "la simulacion ha finalizado"
  end

  desc 'Finalizar simulacion'
  task :stop => :environment do
    Casino.stop
  end


end
