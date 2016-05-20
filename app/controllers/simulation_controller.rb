class SimulationController < ApplicationController

  def index
    @players = Player.all
    

end
