class Fighter < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  has_many :fighter_equipments
  has_many :equipments, through: :fighter_equipments
  
  validates :user_id, uniqueness: true

  def self.fight(fighter_1, fighter_2)
    game = FightService.new(fighter_1, fighter_2)
    game.fight
  end

  def self.ranking_by_victory
    self.all.order(wins: :desc)
  end

  def self.fighters_except_current_user_fighter(user)
    self.all.where.not(user_id: user.id)
  end

  def add_victory_or_defeat(result)
    case result
    when 'win'
      increment!(:wins, by = 1, touch: nil)
    when 'lose'
      increment!(:losses, by = 1, touch: nil)
    end
    update(ratio: calcul_ratio)
  end

  def all_fights
    History.where(winner: self).or(History.where(loser: self))
  end

  def last_fight
    (History.where(winner: self).or(History.where(loser: self))).last
  end

  def attack_fighter(opponent)
    "#{name} attaque #{opponent.name} et inflige #{attack} points de dégats"
  end

  def get_damaged(opponent)
    self.health -= opponent.attack
    "#{name} points de vie: #{health}"
  end

  def equipment_bonus
    self.equipments.each do |equipment|
      self.health += equipment.armor
      self.attack += equipment.attack
    end
  end

  private

  def calcul_ratio
    ((wins.to_f / (wins.to_f + losses.to_f)) * 100)
  end
end
