class PagesController < ApplicationController
  @game_result = nil
  def home
    @fighters = Fighter.all
    @last_fight = History.last
    @last_fight_winner = FighterHistory.find_by(history_id: @last_fight.id, win: true).fighter unless @last_fight == nil
  end

  def fights_history
    @histories = History.all
  end
end
