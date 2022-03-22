class AddValueToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :value, :integer
  end
end
