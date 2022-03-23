class AddUserToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :places, :user, null: true, foreign_key: true
  end
end
