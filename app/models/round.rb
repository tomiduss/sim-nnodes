class Round < ActiveRecord::Base
  has_many :bets
  has_many :players, through: :bets

  def self.play_round(players)
      round = Round.new
  end
end
