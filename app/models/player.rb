class Player < ActiveRecord::Base
  has_many :bets
  has_many :rounds, through: :bets
end
