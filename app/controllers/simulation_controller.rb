require 'rake'
SimRuleta::Application.load_tasks

class SimulationController < ApplicationController

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    @players = Player.all

    @rounds = Round.all.order(date: :desc)
    #@rounds = Round.in_day(@date).order(date: :desc).all

    @bets = params[:round_id] ? Round.find(params[:round_id]).bets : @rounds.first.bets


  end

  def stop
    Casino.stop

    redirect_to :root
  end

  # def start
  #
  #   Rake::Task['sim:start'].invoke
  #
  #   redirect_to :root
  # end


end
