class AddTypesToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :types, :string
  end
end
