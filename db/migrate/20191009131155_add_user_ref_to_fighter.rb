class AddUserRefToFighter < ActiveRecord::Migration[5.2]
  def change
    add_reference :fighters, :user, null: false, index: {unique: true}, foreign_key: true
  end
end
