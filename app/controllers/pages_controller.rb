class PagesController < ApplicationController
  def home
    @fighters = Fighter.all
    if current_user
      @fighters_without_user_fighter = Fighter.fighters_except_current_user_fighter(current_user)
    end
  end

  def fighter_history
    @total_wins = current_user.fighter.wins
    @total_loses = current_user.fighter.losses
    @all_fights = current_user.fighter.all_fights
  end

  def fight_result
    @last_fight = current_user.fighter.last_fight
    @last_fight_winner = @last_fight.winner
    @last_fight_loser = @last_fight.loser
  end

  def fighters_ranking
    @fighters_ranked = Fighter.ranking_by_victory
  end

  def fight_resume
    @history = History.find(params[:id])
  end
end
