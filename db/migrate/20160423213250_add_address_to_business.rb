class AddAddressToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :address, :string
  end
end
