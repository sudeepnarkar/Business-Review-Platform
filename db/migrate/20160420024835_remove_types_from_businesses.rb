class RemoveTypesFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :types, :relation
  end
end
