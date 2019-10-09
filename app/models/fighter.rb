require 'set'

class Fighter < ApplicationRecord
  has_many :fighter_histories, dependent: :destroy
  has_many :histories, through: :fighter_histories

  belongs_to :user

  def self.fight(fighter_1, fighter_2)
    game = GameService.new(fighter_1, fighter_2)
    game.fight
  end
end
