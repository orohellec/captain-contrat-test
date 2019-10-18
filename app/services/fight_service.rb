class FightService
  def initialize(fighter_1, fighter_2)
    @fighter_1 = fighter_1
    @fighter_2 = fighter_2
  end

  def fight_resume(attacker, defender)
    "#{attacker.name} a gagné. #{attacker.name} PV: #{attacker.health} - #{defender.name} PV: #{defender.health}"
  end

  def fight
    result = { winner: nil, loser: nil, resume: [] }
    attacker, defender = @fighter_1, @fighter_2
    result[:resume] << "#{attacker.name} (#{attacker.health} PV) VS #{defender.name} (#{defender.health} PV)"
    while 1
      result[:resume] << attacker.attack_fighter(defender)
      result[:resume] << defender.get_damaged(attacker)
      if defender.health <= 0
        result[:resume] << fight_resume(attacker, defender)
        result[:winner] = attacker
        result[:loser] = defender
        return result
      end
      attacker, defender = defender, attacker
    end
  end
end