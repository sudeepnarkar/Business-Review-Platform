class RemoveDistanceFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :distance, :float
  end
end
