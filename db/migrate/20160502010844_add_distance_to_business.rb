class AddDistanceToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :distance, :float
  end
end
