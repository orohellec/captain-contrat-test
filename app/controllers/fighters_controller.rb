class FightersController < ApplicationController
  before_action :protect_routes, only: [:edit, :destroy, :update]
  before_action :set_fighter, only: [:show, :edit, :update, :destroy]

  def index
    @fighters = Fighter.all
  end

  def show
  end

  def new
    @fighter = Fighter.new
  end

  def edit
  end

  def create
    @fighter = Fighter.new(fighter_params)
    @fighter.user_id = current_user.id

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to @fighter, notice: 'Fighter was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /fighters/1
  # PATCH/PUT /fighters/1.json
  def update
    respond_to do |format|
      if @fighter.update(fighter_params)
        format.html { redirect_to @fighter, notice: 'Fighter was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def fight
    fighter_1 = Fighter.find(params[:fighter1_id]) # current_user_fighter
    fighter_2 = Fighter.find(params[:fighter2_id]) # random fighter (except the current user fighter)

    fight_result = Fighter.fight(fighter_1, fighter_2) # return {winner: Fighter, Loser: Fighter, resume: array}
      Fighter.find(fight_result[:winner].id).add_victory_or_defeat('win')
      Fighter.find(fight_result[:loser].id).add_victory_or_defeat('lose')
    history = History.new(
      winner: fight_result[:winner],
      loser: fight_result[:loser], 
      resume: fight_result[:resume]
    )
    history.save
    redirect_to fight_result_path
  end

  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: 'Fighter was successfully destroyed.' }
    end
  end

  private
    def set_fighter
      @fighter = Fighter.find(params[:id])
    end

    def protect_routes
      redirect_to root_path unless current_user.fighter.id == params[:id].to_i
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_params
      params.require(:fighter).permit(:name, :health, :attack)
    end
end
