class AddMoreColumnsToFighter < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :wins, :integer, default: 0
    add_column :fighters, :losses, :integer, default: 0
    add_column :fighters, :ratio, :float, default: 0.0
  end
end
