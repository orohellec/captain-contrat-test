class Equipment < ApplicationRecord
  has_many :fighter_equipments
  has_many :fighters, through: :fighter_equipments
end
