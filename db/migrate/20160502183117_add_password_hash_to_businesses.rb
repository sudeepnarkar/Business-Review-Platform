class AddPasswordHashToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :password_hash, :string
  end
end
