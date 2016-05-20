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

    bet = {
      "bet" => amount,
      "color" => color_bet
    }
  end

  def color_bet
    n = rand(1..100)
    if n <= 2
      color "green"
    elsif n > 2 and n <= 51
      color "red"
    else
      color "black"
end
