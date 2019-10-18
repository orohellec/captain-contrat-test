class History < ApplicationRecord
  serialize :resume, Array
  belongs_to :winner, class_name: 'Fighter'
  belongs_to :loser, class_name: 'Fighter'
end
