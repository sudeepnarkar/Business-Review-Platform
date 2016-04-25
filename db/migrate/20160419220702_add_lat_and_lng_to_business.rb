class AddLatAndLngToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :lat, :float
    add_column :businesses, :lng, :float
  end
end
