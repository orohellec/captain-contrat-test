class PagesController < ApplicationController
  @game_result = nil
  def home
    @fighters = Fighter.all
    @last_fight = History.last
    # @winner_fight_history= History.last.fighter_histories.where(win: true)
    # @last_fight_winner_id = @winner_fight_history.fighter
    # @last_fight_winner = Fighter.find(last_fight_winner_id[0])
    @last_fight_winner = FighterHistory.find_by(history_id: @last_fight.id, win: true).fighter unless @last_fight == nil


    # @game_result if @game_result != nil
    # @history_second = History.last.resume
  end
end
