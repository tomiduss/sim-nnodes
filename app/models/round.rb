class Round < ActiveRecord::Base
  has_many :bets
  has_many :players, through: :bets

  def self.round_number
    last_round = Round.last
    number = if !last_round
      1
    elsif last_round.date.day == Time.now.day
      last_round.number = last_round.number + 1
    else
      1
    end
  end

  def self.play_round(players)

      round = Round.new(number: round_number, date: Time.now)

      #jugadores ponen sus apuestas
      players.each do |player|
        bet = player.place_bet
        player.bets << bet
        round.bets << bet
      end

      #casino recolecta el dinero
      round.bets.each do |b|
        Casino.instance.money += b.amount
        Casino.instance.save
      end

      #tirar la ruleta
      outcome = spin

      #pagar a jugadores que ganaron
      winner_bets = round.bets.where(color: outcome)

      #eventualmente podrian pagar distinto por cada color, y se podria configurar desde el Casino
      multiplier = outcome == "green" ? 15 : 2

      winner_bets.each do |bet|
        player = bet.player
        player.money += multiplier*bet.amount
        bet.win = true
        Casino.instance.money -= multiplier*bet.amount

        bet.save
        player.save
        Casino.instance.save
      end
      round.save
  end

  def self.spin
    n = rand(1..100)
    color = if n <= 2
       "green"
    elsif n > 2 and n <= 51
      "red"
    else
      "black"
    end
  end

end
