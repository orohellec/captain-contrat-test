class AddUserRefToFighter < ActiveRecord::Migration[5.2]
  def change
    add_reference :fighters, :user, foreign_key: true
  end
end
