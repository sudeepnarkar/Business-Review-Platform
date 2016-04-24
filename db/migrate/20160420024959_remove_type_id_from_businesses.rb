class RemoveTypeIdFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :type_id, :integer
  end
end
