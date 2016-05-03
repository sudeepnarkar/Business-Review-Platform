class AddPasswordSaltToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :password_salt, :string
  end
end
