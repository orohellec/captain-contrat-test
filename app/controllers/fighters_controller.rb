class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :edit, :update, :destroy]

  # GET /fighters
  # GET /fighters.json
  def index
    @fighters = Fighter.all
  end

  # GET /fighters/1
  # GET /fighters/1.json
  def show
  end

  # GET /fighters/new
  def new
    @fighter = Fighter.new
  end

  # GET /fighters/1/edit
  def edit
  end

  # POST /fighters
  # POST /fighters.json
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

  def fight_arena
    selected_player = params[:fighter]
    fighter_1 = Fighter.find(selected_player[:fighter_1])
    fighter_2 = Fighter.find(selected_player[:fighter_2])
    game_result = Fighter.fight(fighter_1, fighter_2)
    history = History.new(resume: game_result[:resume])
    player_1_win = fighter_1.name == game_result[:winner_name] ? true : false

    history.fighter_histories.build(
      fighter_id: fighter_1.id, 
      history_id: history.id, 
      win: player_1_win
    )
    history.fighter_histories.build(
      fighter_id: fighter_2.id,
      history_id: history.id,
      win: !player_1_win
    )
    history.save
    puts @game_result
    redirect_to root_path
  end

  # DELETE /fighters/1
  # DELETE /fighters/1.json
  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: 'Fighter was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fighter
      @fighter = Fighter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_params
      params.require(:fighter).permit(:name, :health, :attack)
    end
end
