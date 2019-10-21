class CreateFighterEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :fighter_equipments do |t|
      t.belongs_to :fighter
      t.belongs_to :equipment
      
      t.timestamps
    end
  end
end
