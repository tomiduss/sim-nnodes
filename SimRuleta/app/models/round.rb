class Round < ActiveRecord::Base
  has_many :bets
  has_many :players, through: :bets

end
