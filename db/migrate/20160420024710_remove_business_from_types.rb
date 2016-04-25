class RemoveBusinessFromTypes < ActiveRecord::Migration
  def change
    remove_column :types, :business, :relation
  end
end
