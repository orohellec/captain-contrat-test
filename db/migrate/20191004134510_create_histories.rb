class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.belongs_to :winner
      t.belongs_to :loser
      t.text :resume

      t.timestamps
    end
  end
end
