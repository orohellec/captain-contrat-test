class PagesController < ApplicationController
  def home
    @fighters = Fighter.all
    if current_user
      @fighters_without_user_fighter = Fighter.fighters_except_current_user_fighter(current_user)
    end
  end

  def game_rules
  end

  def fighter_history
    @total_wins = current_user.fighter.wins
    @total_loses = current_user.fighter.losses
    @all_fights = current_user.fighter.all_fights.order(created_at: :desc)
  end

  def fighters_ranking
    @fighters_ranked = Fighter.ranking_by_victory
  end

  def fight_result
    @history = History.find(params[:id])
    @fight_winner = @history.winner
    @fight_loser = @history.loser
  end
end
