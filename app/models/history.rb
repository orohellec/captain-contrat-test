class History < ApplicationRecord
  serialize :resume, Array
  has_many :fighter_histories, dependent: :destroy
  has_many :fighters, through: :fighter_histories
end
