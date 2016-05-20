class Player < ActiveRecord::Base
  has_many :bets
  has_many :rounds, through: :bets

  def place_bet

    if self.money < 1000
      amount = self.money
      self.money = 0
    else
      amount = rand(8..15)/100*self.money
      self.money - amount
    end

    self.save

    bet = Bet.new(amount: amount, color: color_bet, win: false)

  end

  def color_bet
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
