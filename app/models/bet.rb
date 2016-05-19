class Bet < ActiveRecord::Base
  belongs_to :player
  belongs_to :round
  
end
