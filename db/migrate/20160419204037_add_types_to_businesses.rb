class AddTypesToBusinesses < ActiveRecord::Migration
  def change
    add_reference :businesses, :type, index: true, foreign_key: true
  end
end
