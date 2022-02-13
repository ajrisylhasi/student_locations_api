class AddProfileFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :fullname, :string
    add_column :users, :faculty, :string
    add_column :users, :course, :string
    add_column :users, :nationality, :string
  end
end
