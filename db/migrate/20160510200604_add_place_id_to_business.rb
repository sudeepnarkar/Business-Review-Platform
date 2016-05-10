class AddPlaceIdToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :place_id, :string
  end
end
