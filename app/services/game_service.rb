class GameService
  def initialize(fighter_1, fighter_2)
    @fighter_1 = fighter_1
    @fighter_2 = fighter_2
  end

  def fight
    game_result = { winner: nil, loser: nil, resume: []}
    while (1)
      game_result[:resume].push("#{@fighter_1.name} attaque #{@fighter_2.name} et inflige #{@fighter_1.attack} points de dégats")
      @fighter_2.health -= @fighter_1.attack
      if @fighter_2.health <= 0
        game_result[:resume].push("#{@fighter_2.name} est mort(e). #{@fighter_1.name} à gagné(e)")
        game_result[:resume].push("#{@fighter_1.name} PV: #{@fighter_1.health} #{@fighter_2.name} PV: #{@fighter_2.health}")
        game_result[:winner] = @fighter_1.name
        game_result[:loser] = @fighter_2.name
        return game_result
      end
      game_result[:resume].push("#{@fighter_1.name} PV: #{@fighter_1.health} #{@fighter_2.name} PV: #{@fighter_2.health}")

      game_result[:resume].push("#{@fighter_2.name} attaque #{@fighter_1.name} et inflige #{@fighter_2.attack} points de dégats")
      @fighter_1.health -= @fighter_2.attack
      if @fighter_1.health <= 0
        game_result[:resume].push("#{@fighter_1.name} est mort(e). #{@fighter_2.name} à gagné(e)")
        game_result[:resume].push("#{@fighter_1.name} PV: #{@fighter_1.health} #{@fighter_2.name} PV: #{@fighter_2.health}")
        game_result[:winner] = @fighter_2.name
        game_result[:loser] = @fighter_1.name
        return game_result
      end
      game_result[:resume].push("#{@fighter_1.name} PV: #{@fighter_1.health} #{@fighter_2.name} PV: #{@fighter_2.health}")
    end
  end
end