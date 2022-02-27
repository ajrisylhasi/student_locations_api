class AddPlaceToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :place, null: false, foreign_key: true
  end
end
