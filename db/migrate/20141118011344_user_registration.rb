class UserRegistration < ActiveRecord::Migration
  def up
    drop_table :user
  end
  def down
    drop_table :user
  end
end
