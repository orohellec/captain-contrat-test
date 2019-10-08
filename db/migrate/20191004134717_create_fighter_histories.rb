class CreateFighterHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :fighter_histories do |t|
      t.belongs_to :fighter
      t.belongs_to :history
      t.boolean :win, default: false

      t.timestamps
    end
  end
end
