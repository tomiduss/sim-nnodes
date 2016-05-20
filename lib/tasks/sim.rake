namespace :sim do

  desc 'Iniciar simulación'

  task :start => :environment do
    puts 'Inicio ruleta'
    Casino.instance.start
    interval = Casino.instance.interval

    puts Casino.instance.running

    #while Casino.instance.running do
    loop do
      puts "#{Time.now}" + " - Round #{Round.round_number}"

      players = Player.all

      Round.play_round(players)

      puts "Casino Money = #{Casino.instance.money}"

      sleep interval
    end
  end

  task :stop => :environment do
    Casino.instance.stop
  end


end
