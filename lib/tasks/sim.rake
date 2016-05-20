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

      #Check end of day
      if Time.now.seconds_until_end_of_day <= 3600
        all_players = Player.all
        all_players.each do |p|
          p.money += 10000
          p.save
        end
      end
      

      sleep Casino.interval
    end
    puts "la simulacion ha finalizado"
  end

  desc 'Finalizar simulacion'
  task :stop => :environment do
    Casino.stop
  end


end
