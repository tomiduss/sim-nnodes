namespace :sim do

  desc 'Iniciar simulación'

  task :start => :environment do
    puts 'Inicio ruleta'
    interval = Casino.instance.interval
    loop do
      puts "#{Time.now}"

      players = Player.all

      

      sleep interval
    end
  end


end
