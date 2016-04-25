class AddAverageToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :average, :float
  end
end
