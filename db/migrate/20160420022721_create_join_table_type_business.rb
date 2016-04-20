class CreateJoinTableTypeBusiness < ActiveRecord::Migration
  def change
    create_join_table :types, :businesses do |t|
      # t.index [:type_id, :business_id]
      # t.index [:business_id, :type_id]
    end
  end
end
