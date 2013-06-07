class AddNotRegisteredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :not_registered, :integer
  end
end
