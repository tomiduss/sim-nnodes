class Player < ActiveRecord::Base
  has_many :bets
  has_many :rounds, through: :bets

  scope :with_money, ->{ where("money > ?", 0) }

  def place_bet

    if self.money < 1000
      amount = self.money
      self.money = 0
    else
      amount = ((rand(8..15)).to_d/100*self.money).to_i
      self.money -= amount
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

  # def self.test_color_bet
  #   green = 0
  #   red = 0
  #   black = 0
  #   1000000.times do
  #     case color_bet
  #     when "green"
  #       green += 1
  #     when "red"
  #       red += 1
  #     when "black"
  #       black += 1
  #     end
  #   end
  #
  #   return {green: green.to_f/1000000, red: red.to_f/1000000, black: black.to_f/1000000}
  # end


end
