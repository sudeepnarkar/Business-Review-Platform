class RemoveBusinessIdFromTypes < ActiveRecord::Migration
  def change
    remove_column :types, :business_id, :integer
  end
end
