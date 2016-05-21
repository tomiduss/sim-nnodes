class Round < ActiveRecord::Base
  has_many :bets
  has_many :players, through: :bets

  scope :in_day, ->(date) { where(date: date.beginning_of_day..date.end_of_day) }


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

      round = Round.create(number: round_number, date: Time.now)
      casino_money = Casino.instance.money
      #jugadores ponen sus apuestas
      players.each do |player|
        bet = player.place_bet
        player.bets << bet
        round.bets << bet
        player.save
        round.save
      end

      #casino recolecta el dinero
      puts "Casino recoleta dinero"
      round.bets.each do |b|
        casino_money += b.amount
      end

      #tirar la ruleta
      outcome = spin
      round.result = outcome
      puts "Resultado ruleta: #{outcome}"
      #pagar a jugadores que ganaron
      winner_bets = round.bets.where(color: outcome)

      #eventualmente podrian pagar distinto por cada color, y se podria configurar desde el Casino
      multiplier = outcome == "green" ? 15 : 2

      winner_bets.each do |bet|
        player = bet.player
        player.money += multiplier*bet.amount
        bet.win = true
        casino_money -= multiplier*bet.amount

        bet.save
        player.save

      end
      round.save
      Casino.instance.update(money: casino_money)

  end

  def total_bets
    total = 0
    self.bets.each do |b|
      total += b.amount
    end
    return total
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
